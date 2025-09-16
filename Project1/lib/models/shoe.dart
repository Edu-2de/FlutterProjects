/// Shoe model represents a product in the store
class Shoe {
  final String name;
  final String brand;
  final String imageUrl;
  final double price;
  final List<String> colors;
  final List<int> sizes;
  final double rating;
  final int reviews;
  final String description;

  Shoe({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.rating,
    required this.reviews,
    required this.description,
  });
}
