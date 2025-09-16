import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  ListTile buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
      title: Text(
        title, 
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0, // aumenta o tamanho da fonte
          fontWeight: FontWeight.w400, // opcional: deixa o texto um pouco mais grosso
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50.0, bottom: 20.0, right: 170.0),
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Entrar'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  buildListTile('Ofertas', () {
                    Navigator.pop(context);
                  }),
                  buildListTile('Lançamentos', () {
                    Navigator.pop(context);
                  }),
                  buildListTile('Masculino', () {
                    Navigator.pop(context);
                  }),
                  buildListTile('Feminino', () {
                    Navigator.pop(context);
                  }),
                  buildListTile('Infantil', () {
                    Navigator.pop(context);
                  }),
                  buildListTile('SNKRS', () {
                    Navigator.pop(context);
                  }),
                  const Divider(color: Colors.grey),
                  buildListTile('Help & Support', () {
                    Navigator.pop(context);
                  }),
                  buildListTile('Logout', () {
                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}