import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // garante fundo branco
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // remove o drawer automático
        title: Row(
          children: [
            // Logo na esquerda
            SizedBox(
              height: 20,
              child: Image.asset('assets/logo.png', fit: BoxFit.contain),
            ),
            const Spacer(), 
            // Sacola
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        elevation: 0,
      ),
      endDrawer: const AppDrawer(), // drawer na direita
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: Text(
            'Home Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}