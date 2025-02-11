import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/core/app_constant.dart';
import 'package:note_app/view_model/cubits/add_note_cubit/add_note_cubit.dart';

import '../../../view_model/cubits/notes_cubit/notes_cubit.dart';
import '../../widgets/costume_text_faild.dart';
import 'components/add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is SuccessAddNote) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).getAllNotes();
          }
          if (state is ErrorAddNote) {
            print(state.error);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is LoadingAddNote ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(child: AddNoteForm()),
              ));
        },
      ),
    );
  }
}
