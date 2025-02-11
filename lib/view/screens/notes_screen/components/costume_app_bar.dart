import 'package:flutter/material.dart';

class CostumeAppBar extends StatelessWidget {
  const CostumeAppBar(
      {super.key, this.title, required this.child, this.onPressed});
  final title;
  final IconData child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.05)),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                child,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
