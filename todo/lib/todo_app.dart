import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/providers/all_providers.dart';
import 'package:todo/widgets/title_widget.dart';
import 'package:todo/widgets/todo_list_item_widget.dart';
import 'package:todo/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class todoApp extends ConsumerWidget {
  todoApp({super.key});

final newTodoController = TextEditingController();



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30
        ),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration: const InputDecoration(
              labelText: "what are you doing today ?"
            ),
            onSubmitted: (newTodo) {
             ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
          ),
          const SizedBox(height: 20,),
          const ToolBarWidget(),
          
          for(var i=0 ; i< allTodos.length; i++  )
          Dismissible(
            key: ValueKey(allTodos[i].id),
            onDismissed: (_){
              ref.read(todoListProvider.notifier).remove(allTodos[i]);
            },
            child: TodoListItemWidget(item: allTodos[i]))
        ],
      ),
    );
  }
}