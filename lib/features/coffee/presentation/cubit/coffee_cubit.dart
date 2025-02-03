import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/domain/repositories/abstract_coffee_repository.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit({required this.coffeeRepository}) : super(CoffeeLoading());

  final AbstractCoffeeRepository coffeeRepository;

  Future<void> getNextCoffee() async {
    try {
      emit(CoffeeLoading());
      final coffee = await coffeeRepository.getNextCoffee();
      emit(CoffeeLoaded(coffee: coffee));
    } catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }
}
