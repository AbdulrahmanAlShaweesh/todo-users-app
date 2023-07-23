// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, must_be_immutable, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_users_app/Models/todos_model.dart';
import 'package:todos_users_app/Models/user_model.dart';
import 'package:todos_users_app/Providers/provider.dart';
import 'package:todos_users_app/Screens/todos_screen.dart';
import 'package:todos_users_app/Screens/users_screen.dart';
import 'package:todos_users_app/Services/todos_services.dart';
import 'package:todos_users_app/Services/user_services.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static String id = 'search screen';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderServices>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Search Screen',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                bottom: 10.0,
              ),
              child: Text(
                'Enter the endpoints!',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'enter endpoint?(todos/users)',
                suffixIcon: IconButton(
                  onPressed: () async {
                    if (_controller.text.trim() == 'todos') {
                      TodoServices services = TodoServices();
                      List<TodosModel> todoList =
                          await services.getTodoServices(
                        endPoint: _controller.text.trim(),
                      );
                      data.todo(toDos: todoList);
                      Navigator.pushNamed(context, TodosScreen.id);
                    } else if (_controller.text.trim() == 'users') {
                      UserServices services = UserServices();
                      List<UserModel> usersList =
                          await services.getUserServices(
                        endPoint: _controller.text.trim(),
                      );
                      data.user(users: usersList);
                      Navigator.pushNamed(context, UsersScreen.id);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('invalid endpoints'),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.6,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
