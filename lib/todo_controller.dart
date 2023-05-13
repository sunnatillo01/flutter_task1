import 'package:flutter_task1/respository.dart';
import 'package:flutter_task1/todo.dart';

class TodoController{
  final Repository _repository;
  TodoController (this._repository);

  //get
  Future<List<Todo>>fetchTodoList()async{
    return _repository.getTodoList();
  } 
  //patch
  Future<String> updatePatchCompleted(Todo todo)async{
    return _repository.patchCompleted(todo);
  }

  //put
  Future<String> updatePutCompleted(Todo todo)async{
    return _repository.putCompleted(todo);
  }

  //deleted
   Future<String> deleteTodo(Todo todo)async{
    return _repository.deletedTodo(todo);
  }
  //post
  Future<String> postTodo(Todo todo)async{
    return _repository.postTodo(todo);
  }

}
