import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Title'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // ação ao clicar
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configs'),
              onTap: () {
                // ação ao clicar
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Conteúdo principal')),
    );
  }
}
