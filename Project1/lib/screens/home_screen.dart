import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/search_bar.dart';
import '../widgets/header.dart';
import '../widgets/info_carrousel.dart';/*  */

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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
              child: SearchBarApp(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
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
            )
            
          ],
        ),
      ),
    );
  }
}
