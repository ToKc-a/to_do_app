import 'package:flutter/material.dart';
import 'package:to_do_app/services/notification_services.dart';
import 'package:to_do_app/services/theme_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          Text('Theme Data', style: TextStyle(fontSize: 30.0),)
        ],
      ),
    );
  }

  _appBar(){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: 'Theme Changed',
            body: Get.isDarkMode?'Activated Light Theme':'Activated Dark Theme'
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(Icons.nightlight_round, size: 20.0,),
      ),
      actions: [
        Icon(Icons.person, size: 20.0,),
        SizedBox(width: 20.0)
      ],
    );
  }

}
