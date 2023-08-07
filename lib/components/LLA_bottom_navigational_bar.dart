// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

BottomNavigationBar LLABottomNavigationBar(BuildContext context, Color homeColor, Color quizColor, Color translatorColor) {
    return BottomNavigationBar(
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');

            break;
          case 1:
            Navigator.pushNamed(context, '/quiz');

            break;
          case 2:
            Navigator.pushNamed(context, '/translator');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: homeColor
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.quiz,
            color: quizColor
          ),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt,
            color: translatorColor
          ),
          label: 'Translator',
        ),
        
      ],
    );
  }
