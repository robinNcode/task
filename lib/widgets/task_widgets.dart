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
                            Icon(Icons.delete, color: Colors.red,),
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
            backgroundColor: Colors.white,
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
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.Lorem ipsum is typically a corrupted version of \'De finibus bonorum et malorum\', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.',
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
