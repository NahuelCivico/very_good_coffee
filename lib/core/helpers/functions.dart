import 'dart:math';

class Functions {
  Functions._();

  static String getRandomRate() {
    return (1 + (5 - 1) * (Random().nextDouble())).toStringAsFixed(1);
  }
}
