import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/features/coffee/presentation/cubit/coffee_cubit.dart';
import 'package:very_good_coffee/features/coffee/presentation/view/home_page.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class MockCoffeeCubit extends MockCubit<CoffeeState> implements CoffeeCubit {}

void main() {
  late MockCoffeeCubit mockCoffeeCubit;

  setUp(() {
    mockCoffeeCubit = MockCoffeeCubit();
  });

  group('HomePage', () {
    testWidgets('renders HomePage', (tester) async {
      when(() => mockCoffeeCubit.state).thenReturn(CoffeeLoading());

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<CoffeeCubit>.value(value: mockCoffeeCubit),
            ],
            child: const HomePage(),
          ),
        ),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('renders HomePage with initial loading state', (tester) async {
      when(() => mockCoffeeCubit.state).thenReturn(CoffeeLoading());

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<CoffeeCubit>.value(value: mockCoffeeCubit),
            ],
            child: const HomePage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
