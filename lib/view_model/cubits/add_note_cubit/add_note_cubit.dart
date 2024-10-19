import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/app_constant.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Color(0xff001524);
  addNote(NoteModel note) {
    note.color = color.value;
    emit(LoadingAddNote());
    try {
      var noteBOX = Hive.box<NoteModel>(AppConstant.kNoteBox);
      noteBOX.add(note);
      emit(SuccessAddNote());
    } on Exception catch (e) {
      // TODO
      emit(ErrorAddNote(e.toString()));
    }
  }
}
