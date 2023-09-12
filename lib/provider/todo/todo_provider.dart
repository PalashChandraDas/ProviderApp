import 'package:flutter/widgets.dart';

import '../../model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TODOModel> _todoList = [];
  List<TODOModel> get allTODOList => _todoList;
  var textController = TextEditingController();
  var appBarTitle = 'Todo';
  var headingTitle = 'Todo List';
  var dialogTitleTxt = 'Add todo List';
  var dialogHintTxt = 'write todo item';
  var dialogSubmitTxt = 'Submit';
  var dialogCancelTxt = 'Cancel';

  //add_todo
  void addTodoList(TODOModel todoModel) {
    _todoList.add(todoModel);
    notifyListeners();
  }

  //remove_todo
  void removeTodoList(TODOModel todoModel) {
    final index = _todoList.indexOf(todoModel);
    _todoList.removeAt(index);
    notifyListeners();
  }

  //checkbox_change
  void todoStatusChange(TODOModel todoModel) {
    final index = _todoList.indexOf(todoModel);
    _todoList[index].toggleCompleted();
    notifyListeners();
  }


}
