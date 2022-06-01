

import 'package:crud/models/note.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:crud/pages/list_page.dart';




class Operation {

  
  Operation.ensureInitialized();
  
  static Future<Database> _openDB() async{

    return openDatabase(join(await getDatabasesPath(), 'notes.db'), onCreate: (db,version) {
      return db.execute("CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, content TEXT)",);
    }, version: 1 );
  }

  static Future<int> insert(Note note) async{
   Database database = await _openDB();

  return database.insert("notes", note.toMap());
  }



  static Future<int> delete(Note note) async{
   Database database = await _openDB();

  return database.delete("notes", where: 'title = ?' , whereArgs: [note.title]);
  }

  static Future<int> update(Note note) async{
   Database database = await _openDB();

  return database.update("notes",note.toMap(), where: 'title = ?' , whereArgs: [note.title]);
  }




  static Future<List<Note>> notes() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> notesMap = await  database.query("notes");

    for (var n in notesMap) {
      print("____" +n['title']);
    }

    return List.generate(notesMap.length, (i) => Note(
     
      title: notesMap[i]['title'],
      content: notesMap[i]['content'],
      
      
      
       ),
       );
  }
}