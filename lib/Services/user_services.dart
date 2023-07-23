// ignore_for_file: unused_import, unused_local_variable, dead_code, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todos_users_app/Models/user_model.dart';

class UserServices {
  Future<List<UserModel>> getUserServices({required String endPoint}) async {
    http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/$endPoint'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<UserModel> userList = [];

      for (int i = 0; i < data.length; i++) {
        userList.add(
          UserModel.fromJson(jsonData: data[i]),
        );
      }
      print(userList);
      return userList;
    } else {
      throw Exception('there was an error');
    }
  }
}
