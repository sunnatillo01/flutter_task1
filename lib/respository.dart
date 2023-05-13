import 'package:flutter_task1/todo.dart';

abstract class Repository {
  //get
  Future<List<Todo>> getTodoList();
  //patch
  Future<String> patchCompleted(Todo todo);
  //put
  Future<String> putCompleted(Todo todo);
  //deleted
  Future<String> deletedTodo(Todo todo);
  //post
  Future<String> postTodo(Todo todo);

 




}
