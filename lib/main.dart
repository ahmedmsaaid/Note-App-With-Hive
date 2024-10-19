import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/app_constant.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/notes_app.dart';
import 'package:note_app/view_model/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/view_model/cubits/bloc_observer.dart';
import 'package:note_app/view_model/cubits/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(AppConstant.kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: NotesApp(),
      ),
    );
  }
}
