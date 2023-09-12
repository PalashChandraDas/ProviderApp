import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/counter/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Value: ${context.watch<CounterProvider>().count}'),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().decrementCount();
                },
                child: const Icon(Icons.minimize),
              ),
              const SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterProvider>().incrementCount();
                },
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
