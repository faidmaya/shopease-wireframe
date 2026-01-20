import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial([])) {
    on<AddToCart>((event, emit) {
      final items = List<CartItem>.from(state.items);

      final index = items.indexWhere(
        (item) => item.product.id == event.product.id,
      );

      if (index >= 0) {
        items[index] =
            items[index].copyWith(quantity: items[index].quantity + 1);
      } else {
        items.add(CartItem(product: event.product, quantity: 1));
      }

      emit(CartInitial(items));
    });

    on<IncreaseQty>((event, emit) {
      final items = state.items.map((item) {
        if (item.product.id == event.product.id) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList();

      emit(CartInitial(items));
    });

    on<DecreaseQty>((event, emit) {
      final items = state.items
          .map((item) {
            if (item.product.id == event.product.id) {
              return item.copyWith(quantity: item.quantity - 1);
            }
            return item;
          })
          .where((item) => item.quantity > 0)
          .toList();

      emit(CartInitial(items));
    });

    on<RemoveFromCart>((event, emit) {
      final items = state.items
          .where((item) => item.product.id != event.product.id)
          .toList();

      emit(CartInitial(items));
    });
  }
}
