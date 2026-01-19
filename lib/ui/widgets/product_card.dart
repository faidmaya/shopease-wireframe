import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../pages/detail_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Expanded(child: Image.network(product.image)),
            Text(product.title, maxLines: 2),
            Text('\$${product.price}'),
          ],
        ),
      ),
    );
  }
}
