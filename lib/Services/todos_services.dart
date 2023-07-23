// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos_users_app/Models/todos_model.dart';

class TodoServices {
  Future<List<TodosModel>> getTodoServices({required String endPoint}) async {
    http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/$endPoint'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<TodosModel> toDos = [];
      for (int i = 0; i < data.length; i++) {
        toDos.add(
          TodosModel.fromJson(jsonData: data[i]),
        );
      }
      print(toDos);
      return toDos;
    } else {
      throw Exception('there was an error occurs');
    }
  }
}
