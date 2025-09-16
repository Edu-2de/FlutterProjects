import '../models/shoe.dart';

/// Cart item model to store shoe with quantity and selected options
class CartItem {
  final Shoe shoe;
  final int quantity;
  final String selectedColor;
  final int selectedSize;

  CartItem({
    required this.shoe,
    required this.quantity,
    required this.selectedColor,
    required this.selectedSize,
  });

  /// Total price for this cart item
  double get totalPrice => shoe.price * quantity;

  /// Create a copy of cart item with updated values
  CartItem copyWith({
    Shoe? shoe,
    int? quantity,
    String? selectedColor,
    int? selectedSize,
  }) {
    return CartItem(
      shoe: shoe ?? this.shoe,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
