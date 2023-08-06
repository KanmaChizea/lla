import 'package:flutter/material.dart';

Card ProgressCard() {
  return const Card(
    elevation: 5,
    child: Center(
      child: Text(
        'Today\'s Progress: ',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
