import 'package:kimera_todo/models/category.dart';
import 'package:kimera_todo/models/todo.dart';

class TodoService {
  static List<Todo> _todos = <Todo>[
    Todo(
        title: 'Call my friend Romeo',
        description: 'I must call my friend',
        isDone: true,
        category: Category(name: 'Personal', color: 0xFF2196F3)),
    Todo(
        title: 'Make great flutter applications',
        description: 'Working hard on it',
        isDone: false,
        category: Category(name: 'Personal', color: 0xFFFFFFFF)),
    Todo(
        title: 'Go out to find my dog',
        description: 'I have not any dog',
        isDone: true,
        category: Category(name: 'Personal', color: 0xFF2196F3)),
    Todo(
        title: 'Buy beers at supermarket',
        description: 'I did it',
        isDone: false,
        category: Category(name: 'Personal', color: 0xFF2196F3)),
    Todo(
        title: 'Does english homework',
        description: 'Im waiting for new assignments',
        isDone: true,
        category: Category(name: 'Shares', color: 0xFF2196F3)),
  ];

  static void createTodo(String title, String description, Category category,
      {bool isDone: false}) {
    _todos.add(Todo(
        title: title,
        description: description,
        isDone: isDone,
        category: category));
  }

  static List<Todo> getTodos() {
    return _todos;
  }
}
