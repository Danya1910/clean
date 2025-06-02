import '../entities/product_item.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<ProductItem>> call() {
    return repository.fetchProducts();
  }
}