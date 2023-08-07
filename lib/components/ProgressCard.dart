// ignore_for_file: non_constant_identifier_names, file_names

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
