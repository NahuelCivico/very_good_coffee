import 'package:flutter/material.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';

class VeryGoodRate extends StatelessWidget {
  const VeryGoodRate({required this.rate, super.key});
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: 15,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: VeryGoodColors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: VeryGoodColors.black.withAlpha(100),
        ),
        child: Row(
          children: [
            const Icon(Icons.star, color: VeryGoodColors.yellow, size: 20),
            const SizedBox(width: 5),
            Text(
              rate,
              style: Theme.of(context).primaryTextTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
