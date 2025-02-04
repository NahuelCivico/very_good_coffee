import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/favorite_coffee_cubit.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class VeryGoodButtons extends StatelessWidget {
  const VeryGoodButtons({
    required this.coffee,
    super.key,
  });
  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<FavoriteCoffeeCubit, FavoriteCoffeeState>(
          builder: (context, state) {
            final isFavorite =
                state is FavoriteCoffeeLoaded && state.coffees.contains(coffee);

            return ElevatedButton(
              onPressed: () {
                context.read<FavoriteCoffeeCubit>().toggleLike(coffee: coffee);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: const EdgeInsets.all(9),
                backgroundColor: VeryGoodColors.white,
              ),
              child: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: VeryGoodColors.blue,
                size: 28,
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CoffeeCubit>().getNextCoffee();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            backgroundColor: VeryGoodColors.blue,
          ),
          child: Row(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.nextCoffee,
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
              const Icon(
                size: 20,
                Icons.arrow_forward_rounded,
                color: VeryGoodColors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
