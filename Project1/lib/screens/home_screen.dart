import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/search_bar.dart';
import '../widgets/header.dart';
import '../widgets/info_carrousel.dart';
import '../widgets/video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(
        isFavorite: isFavorite,
        onFavoriteToggle: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
      endDrawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SearchBarHeaderDelegate(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InfoCarousel(
                items: [
                  InfoItem(
                    icon: Icons.local_shipping,
                    text: 'Frete grátis para todo o Brasil',
                  ),
                  InfoItem(icon: Icons.star, text: 'Produtos exclusivos'),
                  InfoItem(icon: Icons.lock, text: 'Compra segura'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: VideoWidget(url: 'assets/videos/nike.mp4'),
            ),
          ),
          // Adicione outros SliverToBoxAdapter para mais conteúdo rolável
        ],
      ),
    );
  }
}

// Crie o delegate para a barra de pesquisa fixa
class _SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: const SearchBarApp(),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
