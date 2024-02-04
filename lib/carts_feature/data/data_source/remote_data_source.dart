import 'dart:convert';

import 'package:ecommerce_motion_flutter/carts_feature/data/models/carts_model.dart';
import 'package:ecommerce_motion_flutter/carts_feature/data/models/sub_model.dart';

import 'package:http/http.dart' as http;

class CartsRemoteDataSource {
  Future<List<CartsModel>> getUserCarts(int userId) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/carts?userId=$userId'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      final carts = jsonList.map((e) {
        return CartsModel.fromJson(e);
      }).toList();

      return carts;
    } else {
      throw Exception('Failed to load user carts');
    }
  }

  Future<void> addToCart(int userId, Product product) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/carts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'product': product.toJson(),
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add product to cart');
    }
  }

  Future<void> removeFromCart(int cartId, int productId) async {
    final response = await http.delete(
      Uri.parse('https://fakestoreapi.com/carts/$cartId/product/$productId'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove product from cart');
    }
  }
}
