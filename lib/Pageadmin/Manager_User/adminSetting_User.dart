import 'package:day14/Pageadmin/Manager_User/Search_user.dart';
import 'package:day14/Pageadmin/Manager_User/Show_Drop_User.dart';
import 'package:day14/Pageadmin/Manager_User/Show_Edit_User.dart';
import 'package:day14/Pageadmin/Manager_User/newdata.dart';
import 'package:day14/Pageadmin/Manager_Room/ShowRoom_Drop.dart';
import 'package:day14/Pageadmin/Manager_Room/ShowRoom_Edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class Manage_User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: Text(
            "จัดการผู้ใช้ระบบ",
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
                          builder: (context) => AddData(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.person_alt_circle,
                    iconStyle: IconStyle(),
                    title: 'เพิ่มสมาชิก',
                    // subtitle: "",
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
                          builder: (context) => Show_Edit_User(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.person_alt_circle,
                    iconStyle: IconStyle(),
                    title: 'แก้ไขสมาชิก',
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
                          builder: (context) => DropUser(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.person_alt_circle,
                    iconStyle: IconStyle(),
                    title: 'ระงับผู้ใช้งาน',
                    // subtitle: "Make Ziar'App yours",
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
