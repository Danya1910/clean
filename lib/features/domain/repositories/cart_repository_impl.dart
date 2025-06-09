import 'package:clean_shop/features/domain/entities/product_item.dart';
import 'package:clean_shop/features/domain/repositories/cart_repositiry.dart';
import 'package:clean_shop/features/domain/entities/cart_item.dart';

class CartRepositoryImpl implements CartRepositiry{
  final Map<int, CartItem> _cartItems = {};

  @override
  Future<void> addQuantity(ProductItem product) async{
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id]!.quantity++;
    } else {
      _cartItems[product.id] = CartItem(product: product);
    }
  }

  @override
  Future<void> removeQuantity(int productId) async{
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId]!.quantity--;
      if (_cartItems[productId]!.quantity <= 0) {
        _cartItems.remove(productId);
      }
    }
  }

  @override
  Future<void> clearCart() async{
    _cartItems.clear();
  }

  @override
  Future<Map<int, CartItem>> getCartsItems() async {
    return Map.from(_cartItems);
  }
}