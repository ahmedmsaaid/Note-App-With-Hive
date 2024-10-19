import 'package:flutter/material.dart';
import 'package:note_app/view/screens/notes_screen/notes_screen.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesScreen(),
    );
  }
}
