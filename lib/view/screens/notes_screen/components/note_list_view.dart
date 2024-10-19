import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view_model/cubits/notes_cubit/notes_cubit.dart';

import 'card_items.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        return ListView.separated(
          itemBuilder: (context, index) => CardItem(note: notes[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 24,
          ),
          itemCount: notes.length,
        );
      },
    );
  }
}
