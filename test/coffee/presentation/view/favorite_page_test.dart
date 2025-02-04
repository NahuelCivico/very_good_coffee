import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/favorite_coffee_cubit.dart';
import 'package:very_good_coffee/features/coffee/presentation/view/favorite_page.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class MockFavoriteCoffeeCubit extends MockCubit<FavoriteCoffeeState>
    implements FavoriteCoffeeCubit {}

void main() {
  late MockFavoriteCoffeeCubit mockFavoriteCoffeeCubit;

  setUp(() {
    mockFavoriteCoffeeCubit = MockFavoriteCoffeeCubit();
  });

  group('FavoritePage', () {
    testWidgets('renders FavoritePage', (tester) async {
      when(() => mockFavoriteCoffeeCubit.state).thenReturn(
        FavoriteCoffeeLoading(),
      );

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<FavoriteCoffeeCubit>.value(
                value: mockFavoriteCoffeeCubit,
              ),
            ],
            child: const FavoritePage(),
          ),
        ),
      );

      expect(find.byType(FavoritePage), findsOneWidget);
    });

    testWidgets('renders HomePage with initial loading state', (tester) async {
      when(() => mockFavoriteCoffeeCubit.state).thenReturn(
        FavoriteCoffeeLoading(),
      );

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<FavoriteCoffeeCubit>.value(
                value: mockFavoriteCoffeeCubit,
              ),
            ],
            child: const FavoritePage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
