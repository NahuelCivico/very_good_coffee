import 'package:very_good_coffee/core/db/very_good_coffee_database.dart';
import 'package:very_good_coffee/features/coffee/data/data_sources/local/abstract_favorites_coffe_api.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';

/// This class is the implementation of the [AbstractFavoritesCoffeeApi] class.
class FavoriteCoffeeImplApi extends AbstractFavoritesCoffeeApi {
  FavoriteCoffeeImplApi(this.database);

  final VeryGoodCoffeeDatabase database;

  /// This method is used to get the list of favorite coffees from the database.
  @override
  Future<List<CoffeeModel>> getFavoriteCoffee() async {
    return database.getFavorites();
  }

  /// This method is used to save a favorite coffee to the database.
  @override
  Future<void> saveFavorite(CoffeeModel coffee) async {
    await database.addFavorite(coffee);
  }

  /// This method is used to delete a favorite coffee from the database.
  @override
  Future<void> deleteFavorite(String imageUrl) async {
    await database.removeFavorite(imageUrl);
  }
}
