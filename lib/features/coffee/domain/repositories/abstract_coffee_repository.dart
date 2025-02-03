import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';

/// Abstract class for the Coffee Repository.
abstract class AbstractCoffeeRepository {
  /// Fetches a random coffee image from the API.
  Future<CoffeeModel> getNextCoffee();
}
