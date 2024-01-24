
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/providers/all_providers.dart';

class TextFieldWidget extends ConsumerWidget {
  const TextFieldWidget({
    super.key,
    required this.newToDoController,
  });

  final TextEditingController newToDoController;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextField(
      controller: newToDoController,
      decoration:
          const InputDecoration(labelText: "Bugün Neler Yapacaksın ?"),
      onSubmitted: (newToDo) {
        ref.read(todoListProvider.notifier).addToDo(newToDo);
      },
    );
  }
}
