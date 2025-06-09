import 'package:clean_shop/features/domain/usecases/auth_client.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, obscureText: true),
            ElevatedButton(
              onPressed: () async {
                final success = await _authService.login(
                  _emailController.text,
                  _passwordController.text
                );
                if (success) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}