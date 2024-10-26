import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_to_do_app/locator.dart';
import 'package:simple_to_do_app/to_do_list.dart/presentation/bloc/to_do_bloc.dart';
import 'package:simple_to_do_app/to_do_list.dart/presentation/to_do_list_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ToDoBloc(),
        child: const ToDoListScreen(),
      ),
    );
  }
}
