import 'dart:convert';
import 'package:flutter_task1/todo.dart';
import 'package:http/http.dart' as http;
import 'respository.dart';

class TodoRepository implements Repository {
  String dataURL = 'https://jsonplaceholder.typicode.com/todos/1';
    
  Future<String> deletedTodo (Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code  : ${response.statusCode}');
    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++) {
      print(body[i]);
      todoList.add(Todo.fromJson(body[i]));
    }
    print(todoList.first.toJson());
    return todoList;
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id} ');
    String resData = '';
    await http.patch(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);

      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async{
    print('${todo.toJson()}');
     var url = Uri.parse('$dataURL/todos/');
     var resData = '';
     var response =await http.post(url,body: todo.toJson());
     print(response.statusCode);
     print(response.body);
     return 'true';


   
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id} ');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);

      return resData = result['completed'];
    });
    return resData;
  }
}
