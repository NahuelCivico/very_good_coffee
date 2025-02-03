import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/domain/repositories/abstract_coffee_repository.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit({required this.coffeeRepository}) : super(CoffeeLoading()) {
    getNextCoffee();
  }

  final AbstractCoffeeRepository coffeeRepository;

  Future<void> getNextCoffee() async {
    emit(CoffeeLoading());
    try {
      final coffee = await coffeeRepository.getNextCoffee();
      emit(CoffeeLoaded(coffee: coffee));
    } catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }

  // Future<void> toggleLike(CoffeeModel coffee) async {
  //   final updatedCoffee = coffee.copyWith(isLiked: !coffee.isLiked);
  //   if (updatedCoffee.isLiked) {
  //     await coffeeRepository.saveFavorite(updatedCoffee);
  //   } else {
  //     await coffeeRepository.deleteFavorite(updatedCoffee.imageUrl);
  //   }
  //   emit(CoffeeLoaded(coffee: updatedCoffee));
  // }
}
