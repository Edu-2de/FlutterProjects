import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CustomHeader({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SizedBox(
          height: 24,
          child: Image.asset('assets/logo.png', fit: BoxFit.contain),
        ),
      ),
      title: const SizedBox(),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: isFavorite ? Colors.red : Colors.black,
          ),
          onPressed: onFavoriteToggle,
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          onPressed: () {},
        ),
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}