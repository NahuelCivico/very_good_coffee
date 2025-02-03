part of 'coffee_cubit.dart';

sealed class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

class CoffeeLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  const CoffeeLoaded({required this.coffee});
  final CoffeeModel coffee;

  @override
  List<Object> get props => [coffee];
}

class CoffeeError extends CoffeeState {
  const CoffeeError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
