import 'package:flutter/material.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';

class VeryGoodCard extends StatelessWidget {
  const VeryGoodCard({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: VeryGoodColors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
