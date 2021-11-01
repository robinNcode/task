import 'package:flutter/material.dart';
import 'package:task/drawer_screen/upload_task.dart';

import 'auth/login.dart';
import 'screens/task_screen.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadTask(),
    );
  }
}
