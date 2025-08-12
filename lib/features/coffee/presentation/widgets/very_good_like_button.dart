import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/favorite_coffee_cubit.dart';

class VeryGoodLikeButton extends StatelessWidget {
  const VeryGoodLikeButton({
    required this.coffee,
    super.key,
  });

  final CoffeeModel coffee;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 15,
      child: BlocSelector<FavoriteCoffeeCubit, FavoriteCoffeeState, bool>(
        selector: (favoriteState) {
          // Selector that returns only if the current coffee is favorite
          if (favoriteState is FavoriteCoffeeLoaded) {
            return favoriteState.coffees.any(
              (favCoffee) => favCoffee.imageUrl == coffee.imageUrl,
            );
          }
          return false;
        },
        builder: (context, isFavorite) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: VeryGoodColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => context
                    .read<FavoriteCoffeeCubit>()
                    .toggleLike(coffee: coffee),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: VeryGoodColors.blue,
                    size: 24,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
