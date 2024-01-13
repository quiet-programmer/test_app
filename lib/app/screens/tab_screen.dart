import 'package:flutter/material.dart';
import 'package:my_template/app/screens/tab_view/fav_screen.dart';
import 'package:my_template/app/screens/tab_view/home_screen.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/utils/hex_to_color.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
    },
    {
      'page': const FavScreen(),
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: hexToColor('#F8F8F8'),
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
              width: 0.5,
              color: frontColor,
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            onTap: _selectPage,
            unselectedItemColor: Colors.black38,
            selectedItemColor: frontColor,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.heart,
                ),
                label: 'Fav',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
