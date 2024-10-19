import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view/screens/add_note_screen/components/colors_list_veiw.dart';
import 'package:note_app/view_model/cubits/add_note_cubit/add_note_cubit.dart';

import '../../../widgets/costume_text_faild.dart';
import 'add_note_bottun.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 24),
          CostumeTextFailed(
            onSaved: (value) {
              title = value;
            },
            title: 'Title',
            maxLines: 1,
          ),
          SizedBox(
            height: 28,
          ),
          CostumeTextFailed(
            onSaved: (value) {
              content = value;
            },
            maxLines: 5,
            title: 'Content',
          ),
          SizedBox(
            height: 28,
          ),
          ColorListView(),
          SizedBox(
            height: 24,
          ),
          AddNoteButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var date = DateTime.now();
                var note = NoteModel(
                    date:
                        "${date.year}- ${date.month}- ${date.day}   ${date.hour}:${date.minute}  ",
                    title: title!,
                    content: content!,
                    color: currentColor);
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                autoValidateMode = AutovalidateMode.always;

                setState(() {});
              }
            },
          ),
          SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
