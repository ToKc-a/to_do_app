import 'package:flutter/material.dart';
import 'package:to_do_app/ui/theme.dart';
import 'package:to_do_app/utils/layout.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppLayout.getWidth(120),
        height: AppLayout.getHeight(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
          color: Themes.primaryClr
        ),
        child: Center(
          child: Text(
            label, style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
