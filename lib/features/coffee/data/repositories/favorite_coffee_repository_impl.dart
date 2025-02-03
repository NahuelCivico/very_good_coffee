import 'package:very_good_coffee/features/coffee/data/data_sources/local/favorite_coffee_impl_api.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/domain/repositories/abstract_favorite_coffee_repository.dart';

class FavoriteCoffeeRepositoryImpl extends AbstractFavoriteCoffeeRepository {
  FavoriteCoffeeRepositoryImpl(this._favoriteCoffeeImpl);

  final FavoriteCoffeeImplApi _favoriteCoffeeImpl;

  @override
  Future<List<CoffeeModel>> getFavoriteCoffee() async {
    return _favoriteCoffeeImpl.getFavoriteCoffee();
  }

  @override
  Future<void> saveFavorite(CoffeeModel coffee) async {
    await _favoriteCoffeeImpl.saveFavorite(coffee);
  }

  @override
  Future<void> deleteFavorite(String imageUrl) async {
    await _favoriteCoffeeImpl.deleteFavorite(imageUrl);
  }
}
