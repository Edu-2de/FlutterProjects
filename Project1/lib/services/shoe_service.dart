import '../models/shoe.dart';

/// Service class to manage shoe data and business logic
/// In a real app, this would connect to an API or database
class ShoeService {
  static final ShoeService _instance = ShoeService._internal();
  factory ShoeService() => _instance;
  ShoeService._internal();

  // Mock data for the shoe store
  final List<Shoe> _allShoes = [
    Shoe(
      name: 'Nike Dunk Low Premium',
      brand: 'Nike',
      imageUrl:
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f8b7516d-ffb8-4750-aefc-5d1dadd96c1e/dunk-low-shoes-t8dLSz.png',
      price: 286.75,
      colors: ['Red', 'White', 'Black'],
      sizes: [39, 40, 41, 42, 43, 44, 45, 46],
      rating: 4.8,
      reviews: 1516,
      description:
          'Created for the hardwood but taken to the streets, the 80s b-ball icon returns with classic details and throwback hoops flair.',
    ),
    Shoe(
      name: 'Air Jordan 1 High',
      brand: 'Nike',
      imageUrl:
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/85f9c818-fd17-4d9a-9d52-6f64c0e3b5e8/air-jordan-1-high-shoes-Lg6VXM.png',
      price: 340.25,
      colors: ['Red', 'Black', 'White'],
      sizes: [39, 40, 41, 42, 43, 44, 45],
      rating: 4.9,
      reviews: 2340,
      description:
          'The Air Jordan 1 High brings back the classic silhouette that started it all. Premium materials and iconic design.',
    ),
    Shoe(
      name: 'Stan Smith',
      brand: 'Adidas',
      imageUrl:
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/44c41c7885d3480eb379aa8d014a1aef_9366/Stan_Smith_Shoes_White_FX5500_01_standard.jpg',
      price: 195.50,
      colors: ['White', 'Green', 'Black'],
      sizes: [38, 39, 40, 41, 42, 43, 44, 45, 46],
      rating: 4.7,
      reviews: 890,
      description:
          'Clean and simple, the Stan Smith shoes are an icon of minimalist design that never goes out of style.',
    ),
    Shoe(
      name: 'Ultraboost 22',
      brand: 'Adidas',
      imageUrl:
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8cd68b2e16f8473e94f4ad7800e80c89_9366/Ultraboost_22_Shoes_Black_GX3059_01_standard.jpg',
      price: 425.00,
      colors: ['Black', 'White', 'Red'],
      sizes: [39, 40, 41, 42, 43, 44, 45],
      rating: 4.6,
      reviews: 654,
      description:
          'Experience incredible energy return with every step. The Ultraboost 22 delivers maximum comfort for all-day wear.',
    ),
    Shoe(
      name: 'Suede Classic',
      brand: 'Puma',
      imageUrl:
          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/374915/02/sv01/fnd/PNA/fmt/png/Suede-Classic-Sneakers',
      price: 165.99,
      colors: ['Red', 'Blue', 'Black'],
      sizes: [38, 39, 40, 41, 42, 43, 44, 45],
      rating: 4.5,
      reviews: 432,
      description:
          'The original B-boy shoe. The Suede has been redefining the game since 1968, and shows no signs of slowing down.',
    ),
    Shoe(
      name: 'RS-X³ Puzzle',
      brand: 'Puma',
      imageUrl:
          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/371570/01/sv01/fnd/PNA/fmt/png/RS-X³-Puzzle-Sneakers',
      price: 245.75,
      colors: ['White', 'Red', 'Yellow'],
      sizes: [39, 40, 41, 42, 43, 44, 45, 46],
      rating: 4.4,
      reviews: 276,
      description:
          'The RS-X³ Puzzle brings together bold design elements and maximum comfort in a futuristic silhouette.',
    ),
  ];

  /// Get all shoes
  List<Shoe> getAllShoes() => List.from(_allShoes);

  /// Get shoes by brand
  List<Shoe> getShoesByBrand(String brand) {
    if (brand.toLowerCase() == 'all') return getAllShoes();
    return _allShoes
        .where((shoe) => shoe.brand.toLowerCase() == brand.toLowerCase())
        .toList();
  }

  /// Get popular shoes (top rated)
  List<Shoe> getPopularShoes() {
    final sorted = List<Shoe>.from(_allShoes);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(4).toList();
  }

  /// Search shoes by name or brand
  List<Shoe> searchShoes(String query) {
    if (query.isEmpty) return getAllShoes();

    final lowercaseQuery = query.toLowerCase();
    return _allShoes
        .where(
          (shoe) =>
              shoe.name.toLowerCase().contains(lowercaseQuery) ||
              shoe.brand.toLowerCase().contains(lowercaseQuery),
        )
        .toList();
  }

  /// Get brands list
  List<String> getBrands() {
    final brands = _allShoes.map((shoe) => shoe.brand).toSet().toList();
    brands.insert(0, 'All');
    return brands;
  }
}
