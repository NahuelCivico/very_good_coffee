import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';

import 'package:very_good_coffee/features/coffee/presentation/cubit/favorite_coffee_cubit.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_card.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_delete_button.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: VeryGoodColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: BlocBuilder<FavoriteCoffeeCubit, FavoriteCoffeeState>(
          builder: (context, state) {
            switch (state) {
              case FavoriteCoffeeLoading():
                return const CircularProgressIndicator(
                  color: VeryGoodColors.blue,
                );
              case FavoriteCoffeeLoaded():
                if (state.coffees.isEmpty) {
                  return Center(
                    child: Text(
                      l10n.emptyLabel,
                      style: Theme.of(context).primaryTextTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: state.coffees.length,
                  itemBuilder: (context, index) {
                    final coffee = state.coffees[index];
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        VeryGoodCard(imageUrl: coffee.imageUrl),
                        VeryGoodDeleteButton(coffee: coffee),
                      ],
                    );
                  },
                );
              case FavoriteCoffeeError():
                return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
