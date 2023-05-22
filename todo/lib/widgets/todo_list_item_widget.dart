import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
final TodoModel item;
 const TodoListItemWidget({super.key, required this.item});
 

  @override
  ConsumerState<TodoListItemWidget> createState() => _TodoListItemWidget();
}

class _TodoListItemWidget extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocusNode;
   late TextEditingController _textController;
   bool _hasFocus = false;

   @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (isFocused) {
        if(!isFocused){
          setState(() {
            _hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(
            id: widget.item.id,
           newDescrtiption: _textController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
            _textController.text = widget.item.description;

          });

          _textFocusNode.requestFocus();
        },
        leading: Checkbox(
          value: widget.item.completed,
         onChanged: (value) {
           ref.read(todoListProvider.notifier).toggle(widget.item.id);
         },
         ),
         title: _hasFocus ? TextField(
          controller: _textController,
          focusNode: _textFocusNode,
         ) : Text(widget.item.description),
      ),
    );
  }
}




