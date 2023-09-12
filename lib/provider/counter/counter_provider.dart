import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  // var _count = 0;
  // int get count => _count;

  var count = 0;

  void incrementCount() {
    count += 1;
    notifyListeners();
  }

  void decrementCount() {
    if (count > 0) {
      count -= 1;
    }

    notifyListeners();
  }
}
