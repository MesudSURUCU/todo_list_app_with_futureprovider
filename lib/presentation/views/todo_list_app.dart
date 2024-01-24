import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/presentation/components/text_field_widget.dart';
import 'package:todo_list_app/presentation/components/title_widgets.dart';
import 'package:todo_list_app/presentation/components/todo_list_item_widget.dart';
import 'package:todo_list_app/presentation/components/toolbar_widget.dart';
import 'package:todo_list_app/presentation/views/future_provider_example.dart';
import 'package:todo_list_app/providers/all_providers.dart';


class ToDoListPage extends ConsumerWidget {
  ToDoListPage({super.key});

  final newToDoController = TextEditingController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allToDos = ref.watch(filteredTodoList);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: ListView(
          children: [
            const TitleWidget(),
            TextFieldWidget(newToDoController: newToDoController),
            const SizedBox(
              height: 20.0,
            ),
             ToolBarWidget(),
            for (var i = 0; i < allToDos.length; i++)
              Dismissible(
                key: ValueKey(allToDos[i].id),
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(allToDos[i]);
                },
                child:  ProviderScope(
                  overrides: [
                    currentTodoProvider.overrideWithValue(allToDos[i]),
                  ],
                  child:const ToDoListItemWidget()),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FutureProviderExample()));
                }, 
                child:const Text("Future Provider Example", style: TextStyle(color: Colors.white),),
              ),
          ],
        ),
      ),
    );
  }
}
