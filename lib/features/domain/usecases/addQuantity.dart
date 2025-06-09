import 'package:clean_shop/features/domain/entities/product_item.dart';
import 'package:clean_shop/features/domain/repositories/cart_repositiry.dart';

class AddToCartUseCase{
  final CartRepositiry cartRepositiry;

  AddToCartUseCase(this.cartRepositiry);
  
  Future<void> execute(ProductItem product) async{
    if(product.id <= 0){
      throw ArgumentError('Invalid Id');
    }
    await cartRepositiry.addQuantity(product);
  }

}