import 'package:very_good_coffee/core/helpers/functions.dart';
import 'package:very_good_coffee/features/coffee/data/data_sources/remoto/coffe_impl_api.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';
import 'package:very_good_coffee/features/coffee/domain/repositories/abstract_coffee_repository.dart';

/// This class is the implementation of the [AbstractCoffeeRepository] class.
class CoffeeRepositoryImpl extends AbstractCoffeeRepository {
  CoffeeRepositoryImpl(this._coffeImplApi);

  final CoffeImplApi _coffeImplApi;

  /// This method is used to get the next coffee.
  @override
  Future<CoffeeModel> getNextCoffee() async {
    try {
      final imageUrl = await _coffeImplApi.fetchCoffeeImage();

      return CoffeeModel(
        imageUrl: imageUrl,
        rating: Functions.getRandomRate(),
        isLiked: false,
      );
    } catch (e) {
      throw FetchCoffeeImageFailure(e.toString());
    }
  }
}
