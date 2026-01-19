import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  /// POST PRODUCT (Dummy)
  Future<bool> addProduct({
    required String title,
    required double price,
    required String description,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "title": title,
        "price": price,
        "description": description,
        "image": "https://i.pravatar.cc",
        "category": "electronics",
      }),
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }
}
