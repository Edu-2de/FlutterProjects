import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../services/shoe_service.dart';
import '../widgets/category_tab.dart';
import '../widgets/modern_product_card.dart';
import '../widgets/custom_search_bar.dart';

/// PopularScreen displays the most popular shoes in a grid view with category tabs and search
class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
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
          'Most Popular',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              // TODO: Show sort options
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          CustomSearchBar(
            hintText: 'Search popular shoes...',
            onChanged: _onSearchChanged,
            onFilterPressed: () {
              // TODO: Show filter bottom sheet
            },
          ),

          // Results count
          if (_searchQuery.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Found ${_filteredShoes.length} shoes for "$_searchQuery"',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
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

          // Grid of shoes
          Expanded(
            child: _filteredShoes.isEmpty
                ? _buildEmptyState()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: shoe,
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

  /// Build empty state when no shoes found
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No shoes found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
