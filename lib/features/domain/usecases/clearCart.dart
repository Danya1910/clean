import 'package:clean_shop/features/domain/repositories/cart_repositiry.dart';

class CleanAllUseCase{
  final CartRepositiry cartRepositiry;

  CleanAllUseCase(this.cartRepositiry);

  Future<void> execute() async{
    await cartRepositiry.clearCart();
  }
}