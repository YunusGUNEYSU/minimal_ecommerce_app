import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/features/models/product.dart';
import 'package:minimal_ecommerce_app/features/service/product.dart';

class Shop extends ChangeNotifier {
  Shop() {
    _productList = ProductService();
  }
  late final IProduct _productList;
  List<Product> get products => _productList.getProduct();
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void deleteFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
