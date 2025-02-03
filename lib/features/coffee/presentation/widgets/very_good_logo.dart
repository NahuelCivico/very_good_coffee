import 'package:flutter/material.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/core/utils/very_good_constants.dart';

class VeryGoodLogo extends StatelessWidget {
  const VeryGoodLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      VeryGoodConstants.veryGoodLogo,
      color: VeryGoodColors.white,
      height: 40,
    );
  }
}
