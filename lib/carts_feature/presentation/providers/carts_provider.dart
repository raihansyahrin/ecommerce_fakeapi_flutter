import 'package:ecommerce_motion_flutter/products_feature/data/models/products_model.dart';
import 'package:ecommerce_motion_flutter/products_feature/data/models/sub_model.dart';
import 'package:flutter/material.dart';
// import 'package:latihan_4/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductsModel> _shopCart = [];
  List<ProductsModel> get shopCart => _shopCart;

  final Map<int, int> _quantityMap =
      {}; // Map untuk menyimpan quantity berdasarkan ID produk

  double getTotalPrice() {
    double totalPrice = 0;

    for (var product in _shopCart) {
      totalPrice += product.price * getQuantity(product.id);
    }

    return totalPrice;
  }

  // Mendapatkan quantity berdasarkan ID produk
  int getQuantity(int id) {
    return _quantityMap[id] ?? 0;
  }

  void addToCart(ProductsModel product) {
    int productId = product.id;

    // Check if the product is already in the cart
    bool productExistsInCart =
        _shopCart.any((cartProduct) => cartProduct.id == productId);

    if (productExistsInCart) {
      // If the product is already in the cart, increment its quantity
      incrementQuantity(productId);
    } else {
      // If the product is not in the cart, add it to the cart
      // Tambahkan quantity berdasarkan ID produk ke dalam map
      _quantityMap[productId] = (_quantityMap[productId] ?? 0) + 1;

      // Tambahkan produk ke dalam keranjang
      _shopCart.add(product);

      notifyListeners();
    }
  }

  void removeToCart(ProductsModel product) {
    int productId = product.id;

    // Kurangi quantity berdasarkan ID produk dari dalam map
    if (_quantityMap[productId] != null && _quantityMap[productId]! > 0) {
      _quantityMap[productId] = _quantityMap[productId]! - 1;
    }

    // Hapus produk dari keranjang
    _shopCart.remove(product);

    notifyListeners();
  }

  void incrementQuantity(int id) {
    // Cari produk dalam keranjang berdasarkan ID
    ProductsModel? existingProduct = _shopCart.firstWhere(
      (element) => element.id == id,
    );

    // ignore: unnecessary_null_comparison
    if (existingProduct != null) {
      // Tambahkan quantity berdasarkan ID produk ke dalam map
      _quantityMap[id] = (_quantityMap[id] ?? 0) + 1;

      // Tambahkan quantity pada produk
      existingProduct.quantity++;
    } else {
      // Jika produk belum ada dalam keranjang, tambahkan ke keranjang dengan quantity 1
      ProductsModel productToAdd = ProductsModel(
        id: id,
        title: "Product $id",
        description: 'Deskripsi produk $id',
        price: 0,
        image: 'https://fakestoreapi.com/products/$id',
        category: 'unknown',
        quantity: 1,
        rating: RatingModel(count: 0, rate: 0),
      );
      _shopCart.add(productToAdd);

      // Tambahkan quantity berdasarkan ID produk ke dalam map
      _quantityMap[id] = 1;
    }

    notifyListeners();
  }

  void decrementQuantity(int id) {
    // Cari produk dalam keranjang berdasarkan ID
    ProductsModel? existingProduct = _shopCart.firstWhere(
      (element) => element.id == id,
    );

    // Kurangi quantity berdasarkan ID produk dari dalam map
    if (_quantityMap[id] != null && _quantityMap[id]! > 0) {
      _quantityMap[id] = _quantityMap[id]! - 1;

      // Kurangi quantity pada produk
      existingProduct.quantity--;
    }

    notifyListeners();
  }

  void getLastElement() {
    //how to get las element?
  }
}
