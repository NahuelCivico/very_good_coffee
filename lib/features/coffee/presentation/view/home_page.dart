import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_buttons.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_card.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_rate.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    context.read<CoffeeCubit>().getNextCoffee();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.veryGoodTitle,
              style: Theme.of(context).primaryTextTheme.labelLarge,
            ),
            BlocBuilder<CoffeeCubit, CoffeeState>(
              builder: (context, state) {
                return SizedBox(
                  height: 300,
                  width: 300,
                  child: switch (state) {
                    CoffeeLoading() => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                            color: VeryGoodColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    CoffeeLoaded() => Stack(
                        alignment: Alignment.center,
                        children: [
                          VeryGoodCard(imageUrl: state.coffee.imageUrl),
                          VeryGoodRate(rate: state.coffee.rating),
                        ],
                      ),
                    CoffeeError() => const Text('Error'),
                  },
                );
              },
            ),
            BlocBuilder<CoffeeCubit, CoffeeState>(
              builder: (context, state) {
                return switch (state) {
                  CoffeeLoading() => const CircularProgressIndicator(
                      color: VeryGoodColors.blue,
                    ),
                  CoffeeLoaded() => VeryGoodButtons(coffee: state.coffee),
                  _ => const SizedBox(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
