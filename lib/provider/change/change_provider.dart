import 'package:flutter/widgets.dart';

class ChangeProvider extends ChangeNotifier {
  var appBarTitle = 'Change Widget';
  bool isSelected = false;

  void changeWidget() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
