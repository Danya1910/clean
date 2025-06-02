void removeQuantity(int productId) {
  if (productId != -1 && cartItems[productId]!.quantity > 0) {
    cartItems[productId]!.quantity = cartItems[productId]!.quantity - 1;
    if (cartItems[productId]!.quantity == 0) {
      cartItems.remove(productId);
    }
    notifyListeners();
  }
}