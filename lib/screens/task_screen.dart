import 'dart:js';
import 'package:flutter/material.dart';
import 'package:task/widgets/custom_drawer.dart';
import 'package:task/widgets/task_widgets.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text('Task Category', style: TextStyle(color: Colors.red, fontSize: 20),),
                        content: Container(
                          height: 400, width: 300,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index){
                              return InkWell(
                                onTap: (){},
                                child: Row(
                                  children: [
                                    const Icon(Icons.info_outline, color: Colors.teal),
                                    const Text('  Category Filters', style: TextStyle(color: Colors.teal),)
                                  ],
                                ),
                              );
                            },
                            itemCount: 20,
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: (){},
                                    child: const Text('Cancel Filter'),
                                  ),
                                  SizedBox(width: 5,),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Close'),
                                  )
                                ],
                              )
                          )
                        ],
                      );
                    }
                );
              },
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
