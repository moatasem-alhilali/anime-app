
// import 'package:note_app_apk/logic/models/note_model.dart';
// import 'package:sqflite/sqflite.dart';

// class DBHelper {
//   static Database _db;
//   static final int _version = 1;
//   static final String _tablename = 'notes';

//   static Future<void> initDb() async {
//     if (_db != null) {
//       return;
//     }
//     try {
//       String _path = await getDatabasesPath() + 'notes.db';
//       _db = await openDatabase(_path, version: _version, onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE $_tablename(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING)",
//         );
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future<int> insert(Note note) async {
//     return await _db.insert(_tablename, note.toJson());
//   }

//   static Future<int> delete(Note note) async {
//     return await _db.delete(_tablename, where: 'id = ?', whereArgs: [note.id]);
//   }

//   static Future<List<Map<String, dynamic>>> query() async {
//     print("query function called");
//     return _db.query(_tablename);
//   }

//   static Future<int> update(Note note) async {
//     print("update function called");
//     return await _db.rawUpdate("UPDATE notes SET title = ?, note = ? WHERE id = ? ", [note.title, note.note, note.id],);
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:note_app_apk/logic/db/db_helper.dart';
// //
// // import 'package:note_app_apk/logic/models/note_model.dart';
// //
// // class NoteController extends GetxController {
// //   final noteList = [];
// //
// //   // @override
// //   // void onReady() {
// //   //   getNotes();
// //   //   super.onReady();
// //   // }
// //
// //   Future<void> addNote({required Note note}) async {
// //     await DBHelper.insert(note);
// //     getNotes();
// //   }
// //
// //   Future<void> getNotes() async {
// //     List<Map<String, dynamic>> notes = await DBHelper.query();
// //     noteList.addAll(notes.map((data) => Note.fromJson(data)).toList());
// //   }
// //
// //   Future<void> deleteNote({required Note note}) async {
// //     await DBHelper.delete(note);
// //     getNotes();
// //   }
// //
// //   Future<void> updateNote({required Note note}) async {
// //     await DBHelper.update(note);
// //     getNotes();
// //   }
// // }
