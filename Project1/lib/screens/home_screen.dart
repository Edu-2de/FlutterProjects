import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../services/shoe_service.dart';

import '../widgets/category_tab.dart';
import '../widgets/modern_product_card.dart';
import '../widgets/custom_search_bar.dart';

/// HomeScreen displays the main app UI: banner, categories, and popular products
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ShoeService _shoeService = ShoeService();
  String _searchQuery = '';
  int _selectedCategory = 0;
  List<String> _categories = [];
  List<Shoe> _shoes = [];
  List<Shoe> _filteredShoes = [];
  final Set<String> _favoriteShoes = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Load shoe data and categories from service
  void _loadData() {
    _categories = _shoeService.getBrands();
    _shoes = _shoeService.getAllShoes();
    _filterShoes();
  }

  /// Filter shoes based on search query and category
  void _filterShoes() {
    List<Shoe> filtered = _shoes;

    // Filter by category
    if (_selectedCategory > 0) {
      filtered = _shoeService.getShoesByBrand(_categories[_selectedCategory]);
    }

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (shoe) =>
                shoe.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                shoe.brand.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    setState(() {
      _filteredShoes = filtered;
    });
  }

  /// Handle search query changes
  void _onSearchChanged(String query) {
    _searchQuery = query;
    _filterShoes();
  }

  /// Handle category selection
  void _onCategorySelected(int index) {
    _selectedCategory = index;
    _filterShoes();
  }

  /// Toggle favorite status for a shoe
  void _toggleFavorite(String shoeName) {
    setState(() {
      if (_favoriteShoes.contains(shoeName)) {
        _favoriteShoes.remove(shoeName);
      } else {
        _favoriteShoes.add(shoeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      appBar: AppBar(
        title: const Text(
          'SneakerHub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildModernDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            CustomSearchBar(
              hintText: 'Search for shoes...',
              onChanged: _onSearchChanged,
              onFilterPressed: () {
                // TODO: Show filter bottom sheet
              },
            ),

            // Special offer banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Special Offer',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Get 30% off on your first order',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Categories section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Category tabs
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return CategoryTab(
                    label: _categories[index],
                    selected: _selectedCategory == index,
                    onTap: () => _onCategorySelected(index),
                  );
                },
              ),
            ),

            // Popular section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Shoes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to popular screen
                      Navigator.pushNamed(context, '/popular');
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Grid of shoes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _filteredShoes.length,
                itemBuilder: (context, index) {
                  final shoe = _filteredShoes[index];
                  return ProductCard(
                    shoe: shoe,
                    isFavorite: _favoriteShoes.contains(shoe.name),
                    onFavoritePressed: () => _toggleFavorite(shoe.name),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail', arguments: shoe);
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Build modern drawer with clean design
  Widget _buildModernDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
              ),
            ),
            child: const SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Color(0xFFE53E3E),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'user@sneakerhub.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.home_outlined, 'Home', () {}),
                _buildDrawerItem(Icons.favorite_outline, 'Favorites', () {}),
                _buildDrawerItem(
                  Icons.shopping_bag_outlined,
                  'My Orders',
                  () {},
                ),
                _buildDrawerItem(Icons.person_outline, 'Profile', () {}),
                _buildDrawerItem(Icons.settings_outlined, 'Settings', () {}),
                const Divider(),
                _buildDrawerItem(Icons.help_outline, 'Help & Support', () {}),
                _buildDrawerItem(Icons.logout, 'Logout', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build drawer item with modern design
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}
