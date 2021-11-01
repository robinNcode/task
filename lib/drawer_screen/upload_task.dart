import 'package:flutter/material.dart';

class UploadTask extends StatefulWidget {
  const UploadTask({Key? key}) : super(key: key);

  @override
  _UploadTaskState createState() => _UploadTaskState();
}

class _UploadTaskState extends State<UploadTask> {
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 50, bottom: 50),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: const Text('All fields are required', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  ),
                ),
                Divider(thickness: 2,),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _customHeader(label: 'Task Category*'),
                      _textFormField(
                        valueKey: 'TaskCategory',
                        controller: _categoryController,
                        enabled: true,
                        maxLength: 100,
                        fct: (){

                        }
                      ),

                      _customHeader(label: 'Task Title*'),
                      _textFormField(
                          valueKey: 'TaskTitle',
                          controller: _titleController,
                          enabled: true,
                          maxLength: 100,
                          fct: (){

                          }
                      ),
                      
                      _customHeader(label: 'Task Description*'),
                      _textFormField(
                          valueKey: 'TaskDescription',
                          controller: _descController,
                          enabled: true,
                          maxLength: 250,
                          fct: (){

                          }
                      ),
                      
                      _customHeader(label: 'Task Deadline Date*'),
                      _textFormField(
                          valueKey: 'TaskDeadline',
                          controller: _dateController,
                          enabled: true,
                          maxLength: 100,
                          fct: (){

                          }
                      ),

                      Center(
                        child: MaterialButton(
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => TaskScreen()));
                          },

                          color: Colors.deepOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customHeader({required String label}){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),
      ),
    );
  }

  Widget _textFormField(
  { required String valueKey,
    required TextEditingController controller,
    required bool enabled,
    required Function fct,
    required int maxLength,
  }
      ){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: (){
          fct();
        },
        child: TextFormField(
          controller: controller,
          maxLines: valueKey == 'TaskDescription' ? 3 : 1,
          maxLength: maxLength,
          enabled: enabled,
          key: ValueKey(valueKey),
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
            ),
          ),
        ),
      ),
    );
  }

}
