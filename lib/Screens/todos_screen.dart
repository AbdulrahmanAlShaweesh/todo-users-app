// ignore_for_file: unused_local_variable, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_users_app/Providers/provider.dart';
import 'package:todos_users_app/Screens/search_screen.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen({super.key});

  static String id = 'todos screen';
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderServices>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Todos Screen',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
            icon: Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemCount: data.todos!.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    data.todoData![index].id.toString(),
                  ),
                ),
                title: Text('Title : ${data.todoData![index].title}'),
                subtitle:
                    Text('iscompleted : ${data.todoData![index].completed}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
