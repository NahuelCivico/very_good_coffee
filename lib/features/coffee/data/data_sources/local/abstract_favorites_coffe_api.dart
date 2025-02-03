import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';

/// Abstraction for the Favorites Coffee API.
abstract class AbstractFavoritesCoffeeApi {
  /// Get all favorites coffees.
  Future<List<CoffeeModel>> getFavorites();

  /// Save a favorite coffee.
  Future<void> saveFavorite(CoffeeModel coffee);

  /// Delete a favorite coffee.
  Future<void> deleteFavorite(String imageUrl);
}
