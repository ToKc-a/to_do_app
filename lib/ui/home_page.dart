import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/services/notification_services.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:to_do_app/ui/add_task_bar.dart';
import 'package:to_do_app/ui/theme.dart';
import 'package:to_do_app/utils/layout.dart';
import 'package:to_do_app/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: EdgeInsets.only(
          top: AppLayout.getHeight(20), left: AppLayout.getWidth(20)),
      child: DatePicker(
        DateTime.now(),
        height: AppLayout.getHeight(100),
        width: AppLayout.getWidth(80),
        initialSelectedDate: DateTime.now(),
        selectionColor: Themes.primaryClr,
        selectedTextColor: Colors.white,
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: EdgeInsets.only(
          left: AppLayout.getWidth(20),
          right: AppLayout.getWidth(20),
          top: AppLayout.getHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                'Today',
                style: headingStyle,
              )
            ],
          ),
          MyButton(label: '+ Add Task', onTap: ()=>Get.to(AddTaskPage()))
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: 'Theme Changed',
              body: Get.isDarkMode
                  ? 'Activated Light Theme'
                  : 'Activated Dark Theme');
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
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
