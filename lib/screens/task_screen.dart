import 'dart:js';

import 'package:flutter/material.dart';
import 'package:task/widgets/task_widgets.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, color: Colors.teal,)
            );
          },
        ),
        backgroundColor: Colors.white,
        title: const Text('Task', style: TextStyle(color: Colors.teal),),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_list_outlined, color: Colors.teal,)
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TaskWidget();
        },
        itemCount: 10,
      ),
    );
  }
}
