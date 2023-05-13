import 'package:flutter/material.dart';

import 'package:flutter_task1/todo.dart';
import 'package:flutter_task1/todo_controller.dart';
import 'package:flutter_task1/todo_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());
    todoController.fetchTodoList();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('REST API')),
      ),
      body: FutureBuilder(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return buildbodycontent(snapshot, todoController);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Todo todo = Todo(userId: 3, id: 3, title: 'sample post', body: false);
        todoController.postTodo(todo);
      }),
    );
  }

  SafeArea buildbodycontent(
      AsyncSnapshot<List<Todo>> snapshot, TodoController todoController) {
    return SafeArea(
      child: ListView.separated(
        itemBuilder: (context, index) {
          var todo = snapshot.data?[index];
          return Container(
            height: 100.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('${todo?.userId}')),
                Expanded(flex: 2, child: Text('${todo?.id}')),
                Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              todoController
                                  .updatePatchCompleted(todo!)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: Text('$value')));
                              });
                            },
                            child: buildCallContainer(
                                'pathc', const Color(0xFFFFE082))),
                        InkWell(
                          onTap: () {
                            todoController.updatePutCompleted(todo!);
                          },
                          child: InkWell(
                            onTap: () {
                              todoController.deleteTodo(todo!).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: Text('$value')));
                              });
                            },
                            child: buildCallContainer(
                                'put', const Color(0xFFE1BEE7)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            todoController.deleteTodo(todo!);
                          },
                          child: buildCallContainer(
                              'del', const Color(0xFFFFCDD2)),
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (contaxt, index) {
          return const Divider(
            thickness: 0.5,
            height: 0.5,
          );
        },
        itemCount: snapshot.data?.length ?? 0,
      ),
    );
  }
}

Container buildCallContainer(String title, Color color) {
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(child: Text('$title')),
  );
}
