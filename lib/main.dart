import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/change/change_provider.dart';
import 'package:provider_app/provider/counter/counter_provider.dart';
import 'package:provider_app/provider/todo/todo_provider.dart';
import 'package:provider_app/screen/change/change_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TodoProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ChangeProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChangeScreen(),
    );
  }
}
