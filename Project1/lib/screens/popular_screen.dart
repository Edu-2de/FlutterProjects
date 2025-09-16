import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../widgets/category_tab.dart';
import '../widgets/modern_product_card.dart';

/// PopularScreen displays the most popular shoes in a grid view with category tabs
class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final List<String> categories = ['All', 'Nike', 'Adidas', 'Puma'];
  int selectedCategory = 0;

  // Example list of shoes (should be shared with HomeScreen in a real app)
  final List<Shoe> shoes = [
    Shoe(
      name: 'Ambush Air',
      brand: 'Nike',
      imageUrl:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/0e2e2e2e-2e2e-2e2e-2e2e-2e2e2e2e2e2e/air-jordan-5-retro-shoes.png',
      price: 286.75,
      colors: ['Orange', 'Milk', 'Red'],
      sizes: [42, 43, 44, 45],
      rating: 5.0,
      reviews: 1516,
      description:
          'Nike Dunk Low Premium. Created for the hardwood but taken to the streets, the 80s b-ball icon returns with classic details and throwback hoops flair.',
    ),
    Shoe(
      name: 'Air Jordan 5',
      brand: 'Nike',
      imageUrl:
          'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,q_auto:eco/0e2e2e2e-2e2e-2e2e-2e2e-2e2e2e2e2e2e/air-jordan-5-retro-shoes.png',
      price: 240.25,
      colors: ['Orange', 'Milk', 'Red'],
      sizes: [42, 43, 44, 45],
      rating: 4.8,
      reviews: 1200,
      description:
          'Classic Air Jordan 5 with premium materials and iconic design.',
    ),
    // Add more shoes as needed
  ];

  @override
  Widget build(BuildContext context) {
    // Filter shoes by selected category
    List<Shoe> filteredShoes = selectedCategory == 0
        ? shoes
        : shoes
              .where((shoe) => shoe.brand == categories[selectedCategory])
              .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category tabs
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryTab(
                  label: categories[index],
                  selected: selectedCategory == index,
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                );
              },
            ),
          ),
          // Grid of shoes
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: filteredShoes.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    shoe: filteredShoes[index],
                    onTap: () {
                      // Navigate to product detail screen
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: filteredShoes[index],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
