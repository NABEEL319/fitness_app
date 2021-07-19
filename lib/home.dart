import 'dart:convert';

import 'package:fitness_app/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

getUser() async {
  var users = [];
  // use https and give link in authorities or uncodedpath ma last page dein gy
  var response = await http.get(Uri.https('raw.githubusercontent.com',
      'codeifitech/fitness-app/master/exercises.json'));
  // jo data respose ma aya ho usy decode kar k jasonData ma store kary..
  var jasonData = jsonDecode(response.body);

  // jasonData sy data ly kar list ma store karny k liy
  // use for loop
  for (var i in jasonData) {
    //create object of UserModel class
// dictionary k andar dictionary access karny ka tarika i['dict name']['key']
    UserModel user = UserModel(i['id'], i['title'], i['thumbnail'], i['gif']);
    // add it into list
    users.add(user);
  }
  print("hello");
  print(users);
  return users;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xff192a56))),
        home: Scaffold(
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Column(
                    children: [
                      Text("Data is empty"),
                      ElevatedButton(onPressed: getUser, child: Text("press"))
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Column(
                    children: [
                      Text("data is coming"),
                      ElevatedButton(onPressed: getUser, child: Text("press")),
                    ],
                  ),
                );
              }
            },
            future: getUser(),
          ),
        ));
  }
}

class UserModel {
  var id;
  var title;
  var thumbnail;
  var gif;
  UserModel(this.id, this.title, this.thumbnail, this.gif);
}
