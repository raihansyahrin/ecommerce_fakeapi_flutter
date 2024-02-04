import 'package:ecommerce_motion_flutter/products_feature/data/data_source/remote_data_source.dart';
import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductsModel> _allProducts = [];
  List<ProductsModel> get allProducts => _allProducts;

  get id => null;

  final _service = AllProductsDataSource();
  bool isLoading = false;

  ProductsModel findById(productId) {
    return allProducts.firstWhere((prodId) => prodId.id == productId);
  }

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.getAllProducts();

      _allProducts = response;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error in getAllProducts: $e');
      isLoading = false;
      notifyListeners();
    }
  }

  Future<ProductsModel?> getProductDetails(int productId) async {
    try {
      final response = await _service.getProductDetails(productId);
      return response;
    } catch (e) {
      print('Error in getProductDetails: $e');
      return null;
    }
  }
  // Future<ProductsModel?> getProductDetails(int productId) async {
  //   try {
  //     final response = await _service.getProductDetails(productId);
  //     return response;
  //   } catch (e) {
  //     print('Error in getProductDetails: $e');
  //     return null;
  //   }
  // }
}
