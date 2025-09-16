import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
            child: const SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildListTile(Icons.home_outlined, 'Home', () {}),
                buildListTile(Icons.favorite_outline, 'Favorites', () {}),
                buildListTile(Icons.shopping_bag_outlined, 'My Orders', () {}),
                buildListTile(Icons.person_outline, 'Profile', () {}),
                buildListTile(Icons.settings_outlined, 'Settings', () {}),
                const Divider(),
                buildListTile(Icons.help_outline, 'Help & Support', () {}),
                buildListTile(Icons.logout, 'Logout', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
