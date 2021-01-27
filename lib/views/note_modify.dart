import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String  noteID;
  bool get isEditing => noteID != null;
  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? "Edit Note": "Create Note"  )),
      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(

          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Note Title"
              ),
            ),

            Container(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Note Content"
              ),
            ),
            RaisedButton(
              child: Text("submit"),
              color: Theme.of(context).primaryColor,
              onPressed: (){
                if(isEditing){

                }else{

                }
                Navigator.of(context).pop();
              },
            )
          ],
        ),

      ),
    );
  }
}
