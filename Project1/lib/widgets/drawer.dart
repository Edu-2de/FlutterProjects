import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 64.0),
              child: Center(
                child: SizedBox(
                  height: 80,
                  child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                ),
              ),
            ),
            Expanded(
              flex: 5, 
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  buildListTile(Icons.home_outlined, 'Home', () {}),
                  buildListTile(Icons.favorite_outline, 'Favorites', () {}),
                  buildListTile(
                    Icons.shopping_bag_outlined,
                    'My Orders',
                    () {},
                  ),
                  buildListTile(Icons.person_outline, 'Profile', () {}),
                  buildListTile(Icons.settings_outlined, 'Settings', () {}),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  buildListTile(Icons.help_outline, 'Help & Support', () {}),
                  buildListTile(Icons.logout, 'Logout', () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
