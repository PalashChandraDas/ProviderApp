import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/todo/todo_provider.dart';

import '../../model/todo_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //declare_instance
    final myProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(myProvider.appBarTitle),
      ),
      floatingActionButton: _floatingBtnWidget(context),
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            child: Center(
                child: Text(
              myProvider.headingTitle,
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          )),
          Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: myProvider.allTODOList.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      onTap: () {
                        // provider.todoStatusChange(provider.allTODOList[i]);
                        //show another route
                      },
                      title: Text(
                        myProvider.allTODOList[i].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 25,
                          decoration:
                              myProvider.allTODOList[i].isCompleted == true
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      leading: Checkbox(
                          shape: const CircleBorder(),
                          value: myProvider.allTODOList[i].isCompleted,
                          onChanged: (selected) {
                            myProvider.todoStatusChange(myProvider.allTODOList[i]);
                          }),
                      trailing: IconButton(
                          onPressed: () {
                            myProvider.removeTodoList(myProvider.allTODOList[i]);
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }

  _floatingBtnWidget(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: () async {
          _showDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //popup_dialog
  _showDialog(context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.read<TodoProvider>().dialogTitleTxt),
          content: TextField(
            controller: context.read<TodoProvider>().textController,
            decoration: InputDecoration(
                hintText: context.read<TodoProvider>().dialogHintTxt),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(context.read<TodoProvider>().dialogCancelTxt)),
            TextButton(
              onPressed: () {
                if (context.read<TodoProvider>().textController.text.isEmpty) {
                  print('Please write todo!');
                  return;
                } else {
                  context.read<TodoProvider>().addTodoList(TODOModel(
                      title: context.read<TodoProvider>().textController.text,
                      isCompleted: false));
                  context.read<TodoProvider>().textController.clear();
                  print('Todo added successfully');
                }

                Navigator.pop(context);
              },
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepPurpleAccent)),
              child: Text(
                context.read<TodoProvider>().dialogSubmitTxt,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
