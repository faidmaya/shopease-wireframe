import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product.image, height: 200),
            const SizedBox(height: 10),
            Text(product.title, style: const TextStyle(fontSize: 18)),
            Text('\$${product.price}'),
            const SizedBox(height: 10),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
