import 'package:flutter/material.dart';

import '../components/LLA_app_bar.dart';
import '../components/LLA_bottom_navigational_bar.dart';
import '../components/ProgressCard.dart';

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
      appBar: LLAAppBar('L L A'),

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
                child: ProgressCard(),
              ),
              const Row(
                children: [],
              ),
            ],
          ),
        ),
      ),

//! the bottom navigational bar
      bottomNavigationBar: LLABottomNavigationBar(context),
    );
  }

  

  
  

}
