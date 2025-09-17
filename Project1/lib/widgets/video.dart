import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String url;

  const VideoWidget({super.key, required this.url});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.url.startsWith('http')) {
      // ignore: deprecated_member_use
      _controller = VideoPlayerController.network(widget.url);
    } else {
      _controller = VideoPlayerController.asset(widget.url);
    }
    _controller.initialize().then((_) {
      setState(() {});
      _controller.setLooping(true); 
      _controller.setVolume(0); 
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller), 
          )
        : const Center(child: CircularProgressIndicator());
  }
}
