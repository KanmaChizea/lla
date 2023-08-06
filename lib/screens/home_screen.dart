import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
//! the appbar
      appBar: AppBar(
          title: const Text(
        'L L A',
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.indigo),
      )),

//! the body of the scaffold
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? the days progress display card
              SizedBox(
                height: size.height * 0.4,
                width: size.width * 0.6,
                child: const Card(
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
                ),
              ),
              const Row(
                children: [],
              ),
            ],
          ),
        ),
      ),

//! the bottom navigational bar
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
