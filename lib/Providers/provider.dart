// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:todos_users_app/Models/todos_model.dart';
import 'package:todos_users_app/Models/user_model.dart';

class ProviderServices extends ChangeNotifier {
  List<TodosModel>? todos;
  List<UserModel>? _users;
  void todo({required List<TodosModel> toDos}) {
    todos = toDos;
    ChangeNotifier;
  }

  void user({required List<UserModel> users}) {
    _users = users;
    notifyListeners();
  }

  List<TodosModel>? get todoData => todos;
  List<UserModel>? get usersData => _users;
}
