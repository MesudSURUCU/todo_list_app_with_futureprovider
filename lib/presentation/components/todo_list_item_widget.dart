import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/providers/all_providers.dart';


class ToDoListItemWidget extends ConsumerStatefulWidget {
  
  const ToDoListItemWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoListItemWidgetState();
}

class _ToDoListItemWidgetState extends ConsumerState<ToDoListItemWidget> {

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
        super.dispose();
        _textFocusNode.dispose();
        _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTodoItem = ref.watch(currentTodoProvider);
    return Focus(
      onFocusChange: (isFocused) {
        if(!isFocused)
        {
          setState((){
            _hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(id: currentTodoItem.id, newDescription: _textController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
            _textFocusNode.requestFocus();
             _textController.text = currentTodoItem.description;
          });        
        },
        leading: Checkbox(
            value: currentTodoItem.completed,
            onChanged: (value) {
             ref.read(todoListProvider.notifier).toggle(currentTodoItem.id);
            }),
        title: _hasFocus ? TextField(controller: _textController, focusNode: _textFocusNode,) : Text(currentTodoItem.description),
      ),
    );
  }
}


