import 'package:dio/dio.dart';
import 'package:very_good_coffee/core/utils/very_good_constants.dart';

import 'package:very_good_coffee/features/coffee/data/data_sources/remoto/abstract_coffee_api.dart';

/// Generic Exception throw during `fetchCoffeeImage` method.
class FetchCoffeeImageFailure implements Exception {
  FetchCoffeeImageFailure(this.message);
  final String message;
}

/// This class is the implementation of the [AbstractCoffeeApi] class.
class CoffeImplApi extends AbstractCoffeeApi {
  CoffeImplApi(this._dio);
  final Dio _dio;

  @override
  Future<String> fetchCoffeeImage() async {
    try {
      final response = await _dio.get<dynamic>(VeryGoodConstants.apiUrl);
      return response.data['file'] as String;
    } catch (e) {
      throw FetchCoffeeImageFailure(e.toString());
    }
  }
}
