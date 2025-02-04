import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/domain/repositories/abstract_favorite_coffee_repository.dart';

part 'favorite_coffee_state.dart';

class FavoriteCoffeeCubit extends Cubit<FavoriteCoffeeState> {
  FavoriteCoffeeCubit({
    required this.favoriteCoffeeRepository,
  }) : super(FavoriteCoffeeLoading()) {
    getFavoriteCoffees();
  }

  final AbstractFavoriteCoffeeRepository favoriteCoffeeRepository;

  Future<void> getFavoriteCoffees() async {
    emit(FavoriteCoffeeLoading());
    try {
      final coffees = await favoriteCoffeeRepository.getFavoriteCoffee();
      emit(FavoriteCoffeeLoaded(coffees: coffees));
    } catch (e) {
      emit(FavoriteCoffeeError(message: e.toString()));
    }
  }

  Future<void> toggleLike({required CoffeeModel coffee}) async {
    try {
      if (state is FavoriteCoffeeLoaded) {
        final currentState = state as FavoriteCoffeeLoaded;
        final updatedItems = List<CoffeeModel>.from(currentState.coffees);

        if (updatedItems.any((c) => c.imageUrl == coffee.imageUrl)) {
          await favoriteCoffeeRepository.deleteFavorite(coffee.imageUrl);
          updatedItems.removeWhere((c) => c.imageUrl == coffee.imageUrl);
        } else {
          await favoriteCoffeeRepository.saveFavorite(coffee);
          updatedItems.insert(0, coffee);
        }

        emit(FavoriteCoffeeLoaded(coffees: updatedItems));
      }
    } catch (e) {
      emit(FavoriteCoffeeError(message: 'Error al actualizar favoritos: $e'));
    }
    return;
  }
}
