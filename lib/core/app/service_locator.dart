import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:very_good_coffee/core/db/very_good_coffee_database.dart';
import 'package:very_good_coffee/features/coffee/data/data_sources/local/favorite_coffee_impl_api.dart';

import 'package:very_good_coffee/features/coffee/data/data_sources/remoto/coffe_impl_api.dart';
import 'package:very_good_coffee/features/coffee/data/repositories/coffee_repository_impl.dart';
import 'package:very_good_coffee/features/coffee/data/repositories/favorite_coffee_repository_impl.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/favorite_coffee_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => VeryGoodCoffeeDatabase.instance)
    ..registerLazySingleton(() => CoffeImplApi(getIt<Dio>()))
    ..registerLazySingleton(
      () => FavoriteCoffeeImplApi(getIt<VeryGoodCoffeeDatabase>()),
    )
    ..registerLazySingleton(() => CoffeeRepositoryImpl(getIt<CoffeImplApi>()))
    ..registerLazySingleton(
      () => FavoriteCoffeeRepositoryImpl(getIt<FavoriteCoffeeImplApi>()),
    )
    ..registerFactory(
      () => CoffeeCubit(coffeeRepository: getIt<CoffeeRepositoryImpl>()),
    )
    ..registerFactory(
      () => FavoriteCoffeeCubit(
        favoriteCoffeeRepository: getIt<FavoriteCoffeeRepositoryImpl>(),
      ),
    );
}
