import 'package:clean_shop/features/domain/entities/product_item.dart';


abstract class ProductRepository {
  Future<List<ProductItem>> fetchProducts();
}