import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_state.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text('Tidak ada item untuk checkout'),
            );
          }

          return Column(
            children: [
              // LIST ITEM
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ListTile(
                      title: Text(item.product.title),
                      subtitle: Text(
                        '${item.quantity} x Rp ${item.product.price}',
                      ),
                      trailing: Text(
                        'Rp ${item.product.price * item.quantity}',
                      ),
                    );
                  },
                ),
              ),

              // TOTAL & BUTTON
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total: Rp ${state.totalPrice}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Checkout berhasil 🎉'),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Bayar Sekarang'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
