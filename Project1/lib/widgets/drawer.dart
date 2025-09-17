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
          fontSize: 20.0, 
          fontWeight: FontWeight.w400, 
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
      onTap: onTap,
    );
  }

   ListTile buildListTileIconRight(Icon icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon.icon, 
        color: Colors.black.withOpacity(0.6), 
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
      title: Text(
        title, 
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
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
                  const Divider(color: Colors.transparent),
                  buildListTileIconRight(const Icon(Icons.inventory_2), 'Acompanhe seu pedido', () {
                    Navigator.pop(context);
                  }),
                  buildListTileIconRight(const Icon(Icons.settings), 'Acessibilidade', () {
                    Navigator.pop(context);
                  }),
                  buildListTileIconRight(const Icon(Icons.help), 'Ajuda', () {
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