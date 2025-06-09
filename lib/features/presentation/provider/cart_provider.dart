import 'package:clean_shop/features/domain/entities/cart_item.dart';
import 'package:clean_shop/features/domain/entities/product_item.dart';
import 'package:clean_shop/features/domain/repositories/product_repository.dart';
import 'package:clean_shop/features/domain/repositories/cart_repositiry.dart';
import 'package:clean_shop/features/domain/usecases/addQuantity.dart';
import 'package:clean_shop/features/domain/usecases/clearCart.dart';
import 'package:clean_shop/features/domain/usecases/removeQuantity.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier{
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final CleanAllUseCase _cleanAllUseCase;
  final CartRepositiry _cartRepositiry;
  final ProductRepository _productRepository;

  List<ProductItem>? _cachedProducts; 
  
  CartProvider ({
    required CartRepositiry cartRepositiry,
    required ProductRepository productRepository,
  })  : _cartRepositiry = cartRepositiry,
        _productRepository = productRepository,
        _addToCartUseCase = AddToCartUseCase(cartRepositiry),
        _removeFromCartUseCase = RemoveFromCartUseCase(cartRepositiry),
        _cleanAllUseCase = CleanAllUseCase(cartRepositiry);

  Future<Map<int, CartItem>> get cartItems => _cartRepositiry.getCartsItems();

  Future<void> addQuantity(ProductItem product) async{
    await _addToCartUseCase.execute(product);
    notifyListeners();
  } 

  Future<void> removeQuantity(int productId) async{
    await _removeFromCartUseCase.execute(productId);
    notifyListeners();
  }

  Future<void> clearCart() async{
    await _cleanAllUseCase.execute();
    notifyListeners();
  }

  Future<List<ProductItem>> getProducts() async{
    _cachedProducts ??= await _productRepository.fetchProducts();
    return _cachedProducts!;
  }

  Future<List<ProductItem>> fetchProducts() {
    return _productRepository.fetchProducts();
  }


}