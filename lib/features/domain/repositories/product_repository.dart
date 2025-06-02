import '../entities/product_item.dart';

abstract class ProductRepository {
  Future<List<ProductItem>> fetchProducts();
}