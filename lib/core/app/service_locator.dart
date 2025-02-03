import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:very_good_coffee/features/coffee/data/data_sources/remoto/coffe_impl_api.dart';
import 'package:very_good_coffee/features/coffee/data/repositories/coffee_repository_impl.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => CoffeImplApi(getIt<Dio>()))
    ..registerLazySingleton(() => CoffeeRepositoryImpl(getIt<CoffeImplApi>()))
    ..registerFactory(
      () => CoffeeCubit(coffeeRepository: getIt<CoffeeRepositoryImpl>()),
    );
}
