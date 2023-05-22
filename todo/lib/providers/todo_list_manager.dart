import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo_model.dart';
import 'package:uuid/uuid.dart';






class TodoListManager extends StateNotifier<List<TodoModel>>{
  TodoListManager([List<TodoModel>? initalTodos]) : super(initalTodos ?? []);

  void addTodo(String description)
  {
    var _addTodo = TodoModel(id: const Uuid().v4(), description: description);
    state = [...state, _addTodo];
  }

  void toggle(String id)
  {
    state = [
      for(var todo in state)
      if(todo.id == id)
      TodoModel(
        id: todo.id,
        description: todo.description,
        completed: !todo.completed
      )else todo,
    ];
  }

  void edit({required String id,required String newDescrtiption})
  {
    state = [
      for(var todo in state)
      if(todo.id == id)
      TodoModel(id: todo.id, description: newDescrtiption,completed: todo.completed)
      else todo
    ];
  }

  void remove(TodoModel removeTodo)
  {
    state = state.where((element) => element.id != removeTodo.id).toList();
  }

}