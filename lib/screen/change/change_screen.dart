import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/change/change_provider.dart';

class ChangeScreen extends StatelessWidget {
  const ChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(myProvider.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: myProvider.isSelected,
                  onChanged: (value) {
                    print('Clicked!');
                    myProvider.changeWidget();
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                myProvider.isSelected == false
                    ? const Text('Unselected')
                    : const Icon(Icons.person),
              ],
            )
          ],
        ),
      ),
    );
  }
}
