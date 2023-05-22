import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var todos = ref.watch(todoListProvider).length.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text("$todos todos")
        ),
        Tooltip(
          message: "All Todos",
          child: TextButton(onPressed: (){}, child: const Text("All")),
        ),
        Tooltip(
          message: "Only Uncompleted Todos",
          child: TextButton(onPressed: (){}, child: const Text("Active")),
        ),
        Tooltip(
          message: "Only Completed Todos",
          child: TextButton(onPressed: (){}, child: const Text("Completed")),
        ),
      ],
    );
  }
}