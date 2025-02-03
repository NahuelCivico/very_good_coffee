/// Abstraction for the Coffee API.
abstract class AbstractCoffeeApi {
  /// Fetches a random coffee image from the API.
  Future<String> fetchCoffeeImage();
}
