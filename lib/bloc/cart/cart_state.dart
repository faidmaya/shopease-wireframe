import '../../data/models/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}

abstract class CartState {
  final List<CartItem> items;

  const CartState(this.items);

  // ✅ TOTAL HARGA (UNTUK CART & CHECKOUT)
  double get totalPrice {
    return items.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }

  // (opsional tapi berguna)
  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}

class CartInitial extends CartState {
  const CartInitial(List<CartItem> items) : super(items);
}
