import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_to_do_app/to_do_list.dart/presentation/bloc/to_do_bloc.dart';
import 'package:simple_to_do_app/to_do_list.dart/presentation/widgets/to_do_list_card.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => ToDoListScreenState();
}

class ToDoListScreenState extends State<ToDoListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ToDoBloc>().add(TodosLoadedRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TO DO LIST'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state is ToDoLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: state.toDos.length,
              itemBuilder: (context, index) {
                return const ToDoListCard();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
