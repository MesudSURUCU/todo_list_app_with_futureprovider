import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/models/todo_models.dart';
import 'package:todo_list_app/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';


enum TodoListFilter {
all, active, completed
}

final todoListFilter = StateProvider((ref) => TodoListFilter.all);

final todoListProvider = StateNotifierProvider<ToDoListManager,List<ToDoModel>>((ref) {
  return ToDoListManager([
    ToDoModel(id:const Uuid().v4(), description: "Spora Git"),
    ToDoModel(id:const Uuid().v4(), description: "Alışveriş Yap"),
    ToDoModel(id:const Uuid().v4(), description: "Ders Çalış"),
    ToDoModel(id:const Uuid().v4(), description: "Tv İzle"),
  ]);
});

final filteredTodoList = Provider<List<ToDoModel>>((ref){
  final filter = ref.watch(todoListFilter);
  final todoList = ref.watch(todoListProvider);

  switch(filter){
    case TodoListFilter.all:
      return todoList;
      case TodoListFilter.completed:
       return todoList.where((element) => element.completed).toList();
       case TodoListFilter.active:
       return todoList.where((element) => !element.completed).toList();
  }
});

final unCompletedTodoCount = Provider<int>((ref){
final allTodo = ref.watch(todoListProvider);
final count = allTodo.where((element) => !element.completed).length;
return count;
});

final currentTodoProvider = Provider<ToDoModel>((ref){
throw UnimplementedError();
});