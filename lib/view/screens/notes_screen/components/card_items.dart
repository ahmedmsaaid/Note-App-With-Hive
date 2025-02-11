import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view/screens/notes_screen/components/costume_app_bar.dart';
import 'package:note_app/view/widgets/costume_text_faild.dart';
import 'package:note_app/view_model/cubits/notes_cubit/notes_cubit.dart';

import '../../edit_note_screen/edit_note.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(note.color),
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNote(
                  note: note,
                ),
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  note.title,
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  note.content,
                  style: TextStyle(
                      fontSize: 18, color: Colors.black.withOpacity(.6)),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).getAllNotes();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 40,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                note.date,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
