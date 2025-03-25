import 'package:flutter/material.dart';
import 'package:flutterappexample/models/product.dart';

class Shop extends ChangeNotifier {
  // product of sale
  final List<Product> _shop = [
    //product 1
    Product(name: 'Apple Watch', 
    price: 5000000, 
    description: "Apple From Mount Fuji",
    imagePath: 'lib/assets/applewatch.jpeg',
    ),

    //product 2
    Product(
      name: 'Lenovo Legion',
      price: 26000000,
      description: "Gaming Laptop has Very Good Performance",
      imagePath: 'lib/assets/LenovoLegion.jpeg',
    ),

    //product 3
    Product(
      name: 'Mouse Fantech',
      price: 500000,
      description: "A good quality mouse with affordable price",
      imagePath: 'lib/assets/mouse.jpeg',
    ),

    //product 4
    Product(
      name: 'Monitor',
      price: 4000000,
      description: "Buat nonton frieren",
      imagePath: 'lib/assets/Monitor.jpeg',
    ),
  ];

  // user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // get item to cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  void addProduct(String name, double price, String description, {String imagePath = "lib/assets/applewatch.jpeg"}) {
    final newProduct = Product(
      name: name,
      price: price,
      description: description,
      imagePath: imagePath,
    );
    _shop.add(newProduct);
    notifyListeners();
  }

  void updateProductDescription(Product product, String newDescription) {
  int index = _shop.indexWhere((p) => p.name == product.name);
  if (index != -1) {
    _shop[index] = Product(
      name: product.name,
      price: product.price,
      description: newDescription,
      imagePath: product.imagePath,
    );
    notifyListeners();
  }
  }
}
