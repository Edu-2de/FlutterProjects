import 'package:flutter/material.dart';

class InfoCarousel extends StatelessWidget {
  final List<InfoItem> items;

  const InfoCarousel({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: PageView.builder(
        itemCount: items.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.black, size: 28),
                const SizedBox(width: 12),
                Text(
                  item.text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InfoItem {
  final IconData icon;
  final String text;

  InfoItem({required this.icon, required this.text});
}