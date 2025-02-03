import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/favorite_coffee_cubit.dart';

class VeryGoodDeleteButton extends StatelessWidget {
  const VeryGoodDeleteButton({
    required this.coffee,
    super.key,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: 35,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: VeryGoodColors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: VeryGoodColors.black.withAlpha(100),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () => context
                  .read<FavoriteCoffeeCubit>()
                  .toggleLike(coffee: coffee),
              child: const Icon(
                Icons.delete_outline,
                color: VeryGoodColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
