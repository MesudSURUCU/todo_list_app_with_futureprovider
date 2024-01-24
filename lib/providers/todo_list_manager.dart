import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/models/todo_models.dart';
import 'package:uuid/uuid.dart';



class ToDoListManager extends StateNotifier<List<ToDoModel>> {
  ToDoListManager([List<ToDoModel>? initialTodos]) : super(initialTodos ?? []);
  
  void addToDo(String description) {
    var addToDo = ToDoModel(id:const Uuid().v4(), description: description);
    state = [...state,addToDo];
    
  }

void toggle(String id) {
 state = [
  for(var todo in state) 
  if(todo.id == id)
  ToDoModel(id: todo.id, 
  description: todo.description, 
  completed: !todo.completed)
  else
  todo,
   ];

}

void edit({required String id,required String newDescription}) {
state = [
  for(var todo in state)
  if(todo.id == id)
  ToDoModel(id: todo.id, completed: todo.completed, description: newDescription)
  else
  todo,
];
}

void remove(ToDoModel deleteTodo){
  state= state.where((element) => element.id != deleteTodo.id).toList();
}

int onCompletedToDoCount(){
  return state.where((element) => !element.completed).length;
}

}