import 'package:flutter/material.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: VeryGoodColors.white,
      body: Center(
        child: Text('Favorite Page'),
      ),
    );
  }
}
