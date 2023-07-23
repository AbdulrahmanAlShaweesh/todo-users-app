// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_users_app/Providers/provider.dart';
import 'package:todos_users_app/Screens/search_screen.dart';
import 'package:todos_users_app/Screens/todos_screen.dart';
import 'package:todos_users_app/Screens/users_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderServices(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SearchScreen.id: (context) => SearchScreen(),
          TodosScreen.id: (contex) => TodosScreen(),
          UsersScreen.id: (context) => UsersScreen()
        },
        initialRoute: SearchScreen.id,
      ),
    );
  }
}
