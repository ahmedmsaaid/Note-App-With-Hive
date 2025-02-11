import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:meta/meta.dart';

import '../../../core/app_constant.dart';
import '../../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  getAllNotes() {
    var noteBOX = Hive.box<NoteModel>(AppConstant.kNoteBox);

    notes = noteBOX.values.toList();
    emit(NotesSuccess());
  }
}
