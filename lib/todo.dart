class Todo {
  int? userId;
  int? id;
  String? title;
  bool? body;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  get completed => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId.toString();
    data['id'] = id.toString();
    data['title'] = title;
    data['body'] = body.toString();
    return data;
  }
}
