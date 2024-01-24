import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/providers/all_providers.dart';


class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({super.key});

  var _currentfilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filt) {
    return _currentfilter == filt ? Colors.blueAccent : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);
    _currentfilter = ref.watch(todoListFilter);
    print('toolbar build tetiklendi');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            onCompletedTodoCount == 0
                ? "Tüm görevler tamamlandı"
                : onCompletedTodoCount.toString() + "görev tamamlanmadı",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        Tooltip(
          message: "All Todos",
          child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: changeTextColor(TodoListFilter.all),
              ),
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.all;
              },
              child: const Text("All")),
        ),
        Tooltip(
          message: "Only Uncompleted Todos",
          child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: changeTextColor(TodoListFilter.active),
              ),
              onPressed: () {
                ref.read(todoListFilter.notifier).state = TodoListFilter.active;
              },
              child: const Text("Active")),
        ),
        Tooltip(
          message: "Only Complated Todos",
          child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: changeTextColor(TodoListFilter.completed),
              ),
              onPressed: () {
                ref.read(todoListFilter.notifier).state =
                    TodoListFilter.completed;
              },
              child: const Text("Completed")),
        ),
      ],
    );
  }
}
