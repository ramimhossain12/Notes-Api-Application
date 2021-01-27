import 'dart:convert';


import 'package:flutter_note/models/api_response.dart';
import 'package:flutter_note/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
  }
}













// import 'dart:convert';
//
// import 'package:flutter_note/models/api_response.dart';
// import 'package:flutter_note/models/note_for_listing.dart';
// import 'package:http/http.dart' as http;
//
// class NotesService{
//
//   static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/apiKey';
//   static const headers = {"apiKey": "d5836840-5533-407e-a50f-c0ef5d0b135d"};
//   Future<APIResponse<List<NoteForListing>>> getNotesList(){
//
//      return http.get(API + '/notes',headers: headers)
//          // ignore: missing_return
//          .then((data) {
//            if(data.statusCode == 200) {
//              final jsonData = json.decode(data.body);
//              final notes = <NoteForListing>[];
//              for (var item in jsonData) {
//                final note = NoteForListing('noteID', 'noteTitle', DateTime.parse(item['createDateTime']) ,item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime'])
//                    : null,
//
//                );
//                notes.add(note);
//
//
//              }
//              return APIResponse<List<NoteForListing>>(data: notes);
//            }
//            return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
//      })
//          .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
//   }
// }