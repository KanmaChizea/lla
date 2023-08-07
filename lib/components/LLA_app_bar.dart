import 'package:flutter/material.dart';

AppBar LLAAppBar(String text, bool backButton) {
    return AppBar(
      automaticallyImplyLeading: backButton,
        title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.indigo),
    ));
  }
