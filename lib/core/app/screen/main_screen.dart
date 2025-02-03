import 'package:flutter/material.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/presentation/view/favorite_page.dart';
import 'package:very_good_coffee/features/coffee/presentation/view/home_page.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_logo.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: VeryGoodColors.blue,
        centerTitle: true,
        title: const VeryGoodLogo(),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        selectedItemColor: VeryGoodColors.white,
        unselectedItemColor: VeryGoodColors.white,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
            ),
            label: l10n.homeLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
            ),
            label: l10n.favoritesLabel,
          ),
        ],
      ),
    );
  }
}
