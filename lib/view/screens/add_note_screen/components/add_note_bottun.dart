import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_constant.dart';
import '../../../../view_model/cubits/add_note_cubit/add_note_cubit.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppConstant.kPrimaryColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return state is LoadingAddNote
                  ? CircularProgressIndicator(
                      color: Colors.black87,
                    )
                  : Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
            },
          ),
        ),
      ),
    );
  }
}
