import 'package:flutter/material.dart';

Widget navButton(IconData icon, String label){
  return  TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      foregroundColor: Colors.black45,
      minimumSize: Size(40, 35), 
      padding: EdgeInsets.zero,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 1),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black45,
          ),
        ),
      ],
      ),
  );
}