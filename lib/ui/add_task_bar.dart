import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/layout.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: AppLayout.getHeight(20),
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'),
        ),
        SizedBox(width: AppLayout.getWidth(20))
      ],
    );
  }
}
