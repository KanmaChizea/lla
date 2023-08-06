import 'package:flutter/material.dart';

BottomNavigationBar LLABottomNavigationBar(BuildContext context) {
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
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.quiz,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt,
            color: Theme.of(context).colorScheme.secondary,
          ),
          label: 'Translator',
        ),
        
      ],
    );
  }
