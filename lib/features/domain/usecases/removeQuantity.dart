import 'package:clean_shop/features/domain/repositories/cart_repositiry.dart';

class RemoveFromCartUseCase {
  final CartRepositiry cartRepositiry;

  RemoveFromCartUseCase(this.cartRepositiry);

  Future<void> execute(int productId) async{
    if(productId <= 0){
      throw ArgumentError("Invalid Id");
    }
    await cartRepositiry.removeQuantity(productId);
  }

}