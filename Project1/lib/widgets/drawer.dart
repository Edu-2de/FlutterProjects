import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key, required ListView child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text('Title'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configs'),
              onTap: () {
                Navigator.pushNamed(context, '/Configs');
              },
            ),
          ],
        ),
      ),
    );
  }
}
