import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Recipe> get recipes => [
    Recipe(
      title: 'Bolo de Cenoura',
      imageUrl:
          'https://www.receitasnestle.com.br/sites/default/files/srh_recipes/7b1571e2e9a6793e1450beaa57661c5e.jpg',
      description: 'Delicioso bolo de cenoura com cobertura de chocolate.',
    ),
    Recipe(
      title: 'Lasanha de Frango',
      imageUrl:
          'https://www.receitasnestle.com.br/sites/default/files/srh_recipes/8fbb6e944d033e8e2c8cf5d5b7a5e7a4.jpg',
      description: 'Lasanha cremosa de frango com queijo.',
    ),
    // Adicione mais receitas se quiser
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // ação ao clicar na lupa
            },
          ),
        ],
      ),
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configs'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: recipes[index]);
        },
      ),
    );
  }
}
