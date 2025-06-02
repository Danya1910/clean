import '../entities/product_item.dart';

void addQuantity(ProductItem product) {
  if (_cartItems.containsKey(product.id)) {
    _cartItems[product.id]!.quantity = cartItems[product.id]!.quantity + 1;
  }
  else{
    _cartItems[product.id] = CartItem(product: product);
  }
  notifyListeners();
}