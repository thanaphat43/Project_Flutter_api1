import 'package:day14/Pageadmin/Manager_User/Show_Drop_User.dart';
import 'package:day14/Pageadmin/Manager_User/Show_Edit_User.dart';
import 'package:day14/Pageadmin/Manager_Room/ShowRoom_Drop.dart';
import 'package:day14/Pageadmin/Manager_Room/ShowRoom_Edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class adminSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: Text(
            "Admin Page",
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
                          builder: (context) => Show_Edit_User(),
                        ),
                      );
                    },
                    icons: CupertinoIcons.person_alt_circle,
                    iconStyle: IconStyle(),
                    title: 'manage users (Edit)',
                    subtitle: "Make Ziar'App yours",
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
                    title: 'manage users (Drop)',
                    subtitle: "Make Ziar'App yours",
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
                    title: 'manage room(Edit)',
                    subtitle: "Make Ziar'App yours",
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
                    title: 'manage room(Drop)',
                    subtitle: "Make Ziar'App yours",
                  ),
                ],
              ),
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.exit_to_app_rounded,
                    title: "Sign Out",
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
