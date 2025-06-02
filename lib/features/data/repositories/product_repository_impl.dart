import 'package:postgres/postgres.dart';
import '../../domain/entities/product_item.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final PostgreSQLConnection connection;

  ProductRepositoryImpl(this.connection);

  @override
  Future<List<ProductItem>> fetchProducts() async {
    await connection.open();
    final results = await connection.mappedResultsQuery('SELECT * FROM product');
    await connection.close();

    return results.map((row) => ProductItem(
      id: row['product']?['id'],
      name: row['product']?['name'],
      cost: row['product']?['cost'],
      image: row['product']?['image'],
    )).toList();
  }
}