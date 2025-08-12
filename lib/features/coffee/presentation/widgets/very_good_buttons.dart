import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class VeryGoodButtons extends StatelessWidget {
  const VeryGoodButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.nextCoffee,
            style: Theme.of(context).primaryTextTheme.labelMedium,
          ),
          const SizedBox(width: 8),
          const Icon(
            size: 20,
            Icons.arrow_forward_rounded,
            color: VeryGoodColors.white,
          ),
        ],
      ),
    );
  }
}
