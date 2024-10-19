import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view_model/cubits/notes_cubit/notes_cubit.dart';

import '../../widgets/costume_text_faild.dart';
import '../notes_screen/components/costume_app_bar.dart';

class EditNote extends StatefulWidget {
  EditNote({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNote> createState() => _EditNoteState();
}

String? title, content;

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CostumeAppBar(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.content = content ?? widget.note.content;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).getAllNotes();
                  Navigator.pop(context);
                },
                title: "Edit Card",
                child: Icons.check,
              ),
              SizedBox(
                height: 24,
              ),
              CostumeTextFailed(
                onChanged: (value) {
                  title = value;
                },
                title: "title",
                maxLines: 2,
              ),
              SizedBox(
                height: 24,
              ),
              CostumeTextFailed(
                  title: "content",
                  maxLines: 5,
                  onChanged: (value) {
                    content = value;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
