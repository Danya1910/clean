import 'package:flutter/material.dart';
import '../domain/entities/cart_item.dart';
import '../domain/entities/product_item.dart';
import '../domain/repositories/product_repository.dart';

class CartProvider with ChangeNotifier {
  final ProductRepository productRepository;
  Map<int, CartItem> _cartItems = {};

  List<ProductItem>? _cachedProducts;

  CartProvider(this.productRepository);

  Map<int, CartItem> get cartItems => _cartItems;

  void addQuantity(ProductItem product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id]!.quantity++;
    } else {
      _cartItems[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void removeQuantity(int productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId]!.quantity--;
      if (_cartItems[productId]!.quantity <= 0) {
        _cartItems.remove(productId);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  Future<List<ProductItem>> getProducts() async {
    if (_cachedProducts != null) {
      return _cachedProducts!;
    } else {
      _cachedProducts = await productRepository.fetchProducts();
      return _cachedProducts!;
    }
  }

  Future<List<ProductItem>> fetchProducts() {
    return productRepository.fetchProducts();
  }
}