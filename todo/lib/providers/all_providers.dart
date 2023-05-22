import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

final todoListProvider = 
StateNotifierProvider<TodoListManager,List<TodoModel>>((ref) {
  return TodoListManager(
    [
      TodoModel(id: const Uuid().v4(), description: "To do Sport"),
      TodoModel(id: const Uuid().v4(), description: "To study"),
      TodoModel(id: const Uuid().v4(), description: "Shopping"),
      TodoModel(id: const Uuid().v4(), description: "Watch Tv"),
      
    ]
  );
},);
