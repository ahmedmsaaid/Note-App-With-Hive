part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class LoadingAddNote extends AddNoteState {}

final class SuccessAddNote extends AddNoteState {}

final class ErrorAddNote extends AddNoteState {
  final String error;
  ErrorAddNote(this.error);
}
