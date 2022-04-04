import 'package:day14/Pageadmin/Manager_User/Show_Drop_User.dart';
import 'package:day14/Pageadmin/Manager_User/Show_Edit_User.dart';
import 'package:day14/Pageadmin/Manager_Room/Search_room_staff.dart';
import 'package:day14/Pageadmin/Manager_Room/ShowRoom_Drop.dart';
import 'package:day14/Pageadmin/Manager_Room/ShowRoom_Edit.dart';
import 'package:day14/Pageadmin/Manager_Room/new_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class Manage_Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: Text(
            "จัดการสถานที่ใช้งาน",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Add_Room2(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.person_alt_circle,
                    iconStyle: IconStyle(),
                    title: 'เพิ่มสถานที่ใช้งาน',
                    // subtitle: "(เพื่มเฉพาะสถานที่สามารถส่ง)",
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_room_Edit(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: 'แก้ไขสถานที่ใช้งาน',
                    // subtitle: "Make Ziar'App yours",
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_room_Drop(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: 'ระงับสถานที่ใช้งาน',
                    // subtitle: "Make Ziar'App yours",
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.exit_to_app_rounded,
                    title: "ออกจากระบบ",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
