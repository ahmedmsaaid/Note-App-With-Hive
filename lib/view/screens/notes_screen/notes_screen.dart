import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/app_constant.dart';
import 'package:note_app/view/screens/notes_screen/components/note_list_view.dart';
import 'package:note_app/view_model/cubits/notes_cubit/notes_cubit.dart';

import '../../widgets/costume_text_faild.dart';
import '../add_note_screen/add_note_screen.dart';
import 'components/card_items.dart';
import 'components/costume_app_bar.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CostumeAppBar(
                title: "Note App",
                child: Icons.search,
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(child: NoteListView()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddNote(),
          );
        },
        backgroundColor: AppConstant.kPrimaryColor,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
