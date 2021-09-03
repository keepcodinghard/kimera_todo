import 'category.dart';

class Todo {
  Todo({this.title, this.description, this.isDone: false, this.category});
  String? title;
  String? description;
  bool isDone = false;
  Category? category;
}
