import 'package:flutter/material.dart';
import 'package:todo_list_app/presentation/views/todo_list_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen
({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    super.initState();
    transition();
  }
void transition() async{
await Future.delayed(const Duration(seconds: 2));
if(!mounted) return;
Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoListPage()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/todolist.png"),
            fit: BoxFit.fill)),
      ),
    );
  }
}