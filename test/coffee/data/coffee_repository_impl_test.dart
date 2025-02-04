import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/features/coffee/data/data_sources/remoto/coffe_impl_api.dart';
import 'package:very_good_coffee/features/coffee/data/repositories/coffee_repository_impl.dart';
import 'package:very_good_coffee/features/coffee/domain/models/coffee_model.dart';

class MockCoffeImplApi extends Mock implements CoffeImplApi {}

class MockFunctions extends Mock {
  static String getRandomRate() => '4.5';
}

void main() {
  late CoffeeRepositoryImpl coffeeRepository;
  late MockCoffeImplApi mockCoffeImplApi;

  setUp(() {
    mockCoffeImplApi = MockCoffeImplApi();
    coffeeRepository = CoffeeRepositoryImpl(mockCoffeImplApi);
  });

  group('CoffeeRepositoryImpl', () {
    test('should call fetchCoffeeImage and return a CoffeeModel', () async {
      const testImageUrl = 'https://example.com/coffee.jpg';
      when(() => mockCoffeImplApi.fetchCoffeeImage())
          .thenAnswer((_) async => testImageUrl);

      final result = await coffeeRepository.getNextCoffee();

      expect(result, isA<CoffeeModel>());
      expect(result.imageUrl, testImageUrl);
      expect(result.rating, isNotNull);
      expect(result.isLiked, 0);

      verify(() => mockCoffeImplApi.fetchCoffeeImage()).called(1);
    });

    test('should throw FetchCoffeeImageFailure when fetchCoffeeImage fails',
        () async {
      when(() => mockCoffeImplApi.fetchCoffeeImage())
          .thenThrow(Exception('Network error'));

      expect(
        () => coffeeRepository.getNextCoffee(),
        throwsA(isA<FetchCoffeeImageFailure>()),
      );

      verify(() => mockCoffeImplApi.fetchCoffeeImage()).called(1);
    });
  });
}
