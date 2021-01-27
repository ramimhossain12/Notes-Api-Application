import 'package:flutter/material.dart';
import 'package:flutter_note/models/note_for_listing.dart';
import 'package:flutter_note/service/notes_service.dart';
import 'package:flutter_note/views/note_delet.dart';
import 'package:flutter_note/views/note_modify.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatelessWidget {
  NotesService get service => GetIt.I<NotesService>();

  List<NoteForListing> notes = [];



  @override
  void initState() {
    notes = service.getNotesList();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.black,
        ),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => NoteDelete());
              return result;
            },
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text("Last edited on ${notes[index].lastEditDateTime}"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
