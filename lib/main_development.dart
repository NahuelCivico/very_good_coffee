import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/bootstrap.dart';
import 'package:very_good_coffee/core/app/app.dart';
import 'package:very_good_coffee/core/app/service_locator.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';

void main() {
  bootstrap(
    () => BlocProvider(
      create: (_) => getIt<CoffeeCubit>(),
      child: const App(),
    ),
  );
}
