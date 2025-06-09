import 'package:clean_shop/features/domain/entities/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:provider/provider.dart';
import 'features/data/repositories/product_repository_impl.dart';
import 'features/presentation/pages/ShopPage.dart';

void main() {
  final connection = PostgreSQLConnection(
    '10.0.2.2',
    5432,
    'shopdb',
    username: 'postgres',
    password: 'Daniil1910',
    timeoutInSeconds: 30,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(ProductRepositoryImpl(connection)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ShopPage(),
    );
  }
}

