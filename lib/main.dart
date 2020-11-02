// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.highContrastLight(),
      ),
      home: Notepad(),
    );
  }
}

class MockNotes {
  MockNotes({this.title, this.content, this.creationTime, this.lastModified});

  final String title;
  final String content;
  final DateTime creationTime;
  final DateTime lastModified;
}

class Notepad extends StatefulWidget {
  @override
  _NotepadState createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  static List<MockNotes> _notesList = [
    MockNotes(
        title: "Groceries",
        content: "apple, pear, oranges",
        creationTime: null,
        lastModified: new DateTime.now()),
    MockNotes(
        title: "Music",
        content: "conan gray, taylor swift, the weeknd",
        creationTime: null,
        lastModified: new DateTime.now()),
    MockNotes(
        title: "Courses to take",
        content: "mie343, mie350, mie360",
        creationTime: null,
        lastModified: new DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
      ),
      body: _buildNotesList(),
    );
  }

  Widget _buildNotesList() {
    return new ListView(
        children: new List.generate(_notesList.length, (index) {
      return _buildRow(_notesList[index]);
    }));
  }

  Widget _buildRow(MockNotes note) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.dehaze_rounded),
        title: Text(
          note.title,
          style: TextStyle(
            fontSize: 23.0,
          ),
        ),
        subtitle: Text(note.content),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(10.0),
    );
  }
}
