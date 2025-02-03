import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';

/// Abstract class for the Favorite Coffee Repository.
abstract class AbstractFavoriteCoffeeRepository {
  /// This method is used to get the list of favorite coffees.
  Future<List<CoffeeModel>> getFavorites();

  /// This method is used to save a favorite coffee.
  Future<void> saveFavorite(CoffeeModel coffee);

  /// This method is used to delete a favorite coffee.
  Future<void> deleteFavorite(String imageUrl);
}
