import 'package:postgres/postgres.dart';
import '../../domain/entities/product_item.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final PostgreSQLConnection connection;
  bool _isConnectionOpen = false;
  ProductRepositoryImpl(this.connection);

  Future<void> _ensureConnection() async {
    if (!_isConnectionOpen) {
      try {
        await connection.open().timeout(Duration(seconds: 10));
        _isConnectionOpen = true;
      } catch (e) {
        _isConnectionOpen = false;
        throw Exception('Не удалось подключиться к базе данных: $e');
      }
    }
  }

  @override
  Future<List<ProductItem>> fetchProducts() async {
    try {
      await _ensureConnection();
      final results = await connection.mappedResultsQuery('SELECT * FROM product');
      return _mapResults(results);
    } catch (e) {
      _isConnectionOpen = false;
      rethrow;
    }
  }

  List<ProductItem> _mapResults(List<Map<String, Map<String, dynamic>>> results) {
    return results.map((row) {
      final data = row['product']!;
      return ProductItem(
        id: data['id'] as int,
        name: data['name'] as String,
        cost: data['cost'] as int,
        image: data['image'] as String,
      );
    }).toList();
  }

  Future<void> close() async {
    if (_isConnectionOpen) {
      try {
        await connection.close();
        _isConnectionOpen = false;
      } catch (e) {
        print('Error closing connection: $e');
      }
    }
  }
}

