import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 10,
      child: ListTile(
        onTap: () {},
        onLongPress: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.delete_rounded, color: Colors.red,),
                            Text('Delete', style: TextStyle(color:Colors.red),)
                          ],
                        )
                    )
                  ],
                );
              }
          );
        },
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 2),
            )
          ),
          child: CircleAvatar(
            radius: 20,
            child: Image.network('https://cdn-icons-png.flaticon.com/512/5218/5218437.png'),
          )
        ),
        title: const Text(
          'Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.linear_scale_outlined, color: Colors.teal,),
            const Text(
              'This is a list tile , onek kichu korte hobe,  eto kom korle ki hobe.  amar sonar bangla ami tomay valobashi.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right, color: Colors.teal, size: 30,
        ),
      ),
    );
  }
}
