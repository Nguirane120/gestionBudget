import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/screens/homescreen.dart';
import 'package:gestionbudget/screens/revenuscreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homescreen(),
    const Revenuscreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Revenus',
          ),
        ],
        selectedItemColor: AppColor.primarycolor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
