import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/ui/theme.dart';
import 'package:to_do_app/widgets/input_field.dart';

import '../utils/layout.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat.Hm().format(DateTime.now()).toString();
  String _endTime = '23:59';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Container(
        padding: EdgeInsets.only(
            left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              MyInputField(title: 'Title', hint: 'Enter title here'),
              MyInputField(title: 'Note', hint: 'Enter your note'),
              MyInputField(
                title: 'Date',
                hint: DateFormat.yMMMMd().format(_selectedDate),
                widget: IconButton(
                    onPressed: () {
                      _getDateFromUser();
                    },
                    icon: Icon(Icons.calendar_today_outlined,
                        color: Colors.grey)),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                    title: 'Start Time',
                    hint: _startTime,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        )),
                  )),
                  SizedBox(width: AppLayout.getWidth(12)),
                  Expanded(
                      child: MyInputField(
                    title: 'End Time',
                    hint: _endTime,
                    widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        )),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
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

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2222));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) {
    var pickedTime = _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null){
      print('Time cancelled');
    } else if(isStartTime==true){
      _startTime = _formatedTime;
    } else if(isStartTime ==false ){
      _endTime = _formatedTime;
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay.now());
  }
}
