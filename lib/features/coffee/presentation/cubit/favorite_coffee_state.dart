part of 'favorite_coffee_cubit.dart';

sealed class FavoriteCoffeeState extends Equatable {
  const FavoriteCoffeeState();

  @override
  List<Object> get props => [];
}

class FavoriteCoffeeLoading extends FavoriteCoffeeState {}

class FavoriteCoffeeLoaded extends FavoriteCoffeeState {
  const FavoriteCoffeeLoaded({required this.coffees});
  final List<CoffeeModel> coffees;

  @override
  List<Object> get props => [coffees];
}

class FavoriteCoffeeError extends FavoriteCoffeeState {
  const FavoriteCoffeeError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
