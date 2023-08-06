import 'package:flutter/material.dart';

AppBar LLAAppBar(String text) {
    return AppBar(
        title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.indigo),
    ));
  }
