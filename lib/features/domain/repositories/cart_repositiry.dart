import 'package:clean_shop/features/domain/entities/cart_item.dart';
import 'package:clean_shop/features/domain/entities/product_item.dart';

abstract class CartRepositiry {
  Future<void> addQuantity(ProductItem product);
  Future<void> removeQuantity(int productId);
  Future<void> clearCart();
  Future<Map<int, CartItem>> getCartsItems();
}
