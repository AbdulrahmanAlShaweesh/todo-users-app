// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable, prefer_is_empty, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_users_app/Providers/provider.dart';
import 'package:todos_users_app/Screens/search_screen.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  static String id = 'users screen';

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
      body: data.usersData!.length != 0
          ? ListView.builder(
              itemCount: data.usersData!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(
                    10.0,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    elevation: 20,
                    color: Colors.amber.shade300,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            data.usersData![index].id.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name => ${data.usersData![index].name} ',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'username => ${data.usersData![index].username}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'emial => ${data.usersData![index].emial}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'City Name => ${data.usersData![index].address.city}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Street Name => ${data.usersData![index].address.street}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'suite => ${data.usersData![index].address.suite}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'zipcode => ${data.usersData![index].address.zipcode}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'lat => ${data.usersData![index].address.geo.lat}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Lng => ${data.usersData![index].address.geo.lng}',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Container(
              child: Text('No Users avilable'),
            ),
    );
  }
}
