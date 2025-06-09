import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:postgres/postgres.dart';

final conn = PostgreSQLConnection(
  '10.0.2.2',
    5432,
    'shopdb',
    username: 'postgres',
    password: 'Daniil1910',
    timeoutInSeconds: 30,
);

Future<Response> login(Request request) async {
  final data = await request.readAsString();
  final json = Map<String, dynamic>.from(jsonDecode(data));
  
  final result = await conn.query(
    'SELECT id, password FROM users WHERE email = @email',
    substitutionValues: {'email': json['email']});
  
  if (result.isEmpty) return Response(401, body: 'User not found');
  
  final user = result[0];
  if (verifyPassword(json['password'], user[1])) {
    return Response.ok(jsonEncode({'token': generateJWT(user[0])}));
  }
  return Response(401, body: 'Invalid credentials');
}

void main() async {
  await conn.open();
  final app = Router()
    ..post('/login', login);
  
  serve(app.call, '0.0.0.0', 8080);
}

bool verifyPassword(String inputPassword, String storedHash) {
  var bytes = utf8.encode(inputPassword);
  var digest = sha256.convert(bytes);
  return digest.toString() == storedHash;
}

String generateJWT(int userId) {
  final jwt = JWT(
    {
      'sub': userId.toString(),
      'iat': DateTime.now().millisecondsSinceEpoch,
      'exp': DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch,
    },
  );
  return jwt.sign(SecretKey('bAo7MyhEmW')); 
}