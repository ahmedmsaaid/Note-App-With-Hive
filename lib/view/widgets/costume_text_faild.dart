import 'package:flutter/material.dart';

import '../../core/app_constant.dart';

class CostumeTextFailed extends StatelessWidget {
  const CostumeTextFailed(
      {super.key,
      required this.title,
      required this.maxLines,
      this.onSaved,
      this.onChanged});
  final String title;
  final int maxLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "please fill this field";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: title,
        border: buildBorder(),
        focusedBorder: buildBorder(color: AppConstant.kPrimaryColor),
      ),
    );
  }
}

OutlineInputBorder buildBorder({color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
