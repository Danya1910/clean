import 'package:clean_shop/features/domain/entities/product_item.dart';

class CartItem {
  final ProductItem product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}