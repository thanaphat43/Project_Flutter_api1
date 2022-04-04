import 'package:day14/Pageadmin/Manager_User/Show_Drop_User.dart';
import 'package:day14/Pageadmin/Manager_User/Show_Edit_User.dart';
import 'package:day14/Pageadmin/Manager_position/Show_Edit_position.dart';
import 'package:day14/Pageadmin/Manager_position/adminSetting_Position.dart';
import 'package:day14/Pageadmin/Manager_sensor/admin_setting_sensor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mysql_crud/main.dart';
// import 'package:flutter_mysql_crud/pageAdmin/Mamager_User/Show_Drop_User.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../connect/ip.dart';

class Edit_sensor extends StatefulWidget {
  final List list;
  final int index;

  Edit_sensor({this.list, this.index});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit_sensor> {
  TextEditingController sensor_name = new TextEditingController();

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to drop '${widget.list[widget.index]['sensor_name']}'"),
      actions: <Widget>[
        new FlatButton(
          child: new Text(
            "OK !",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            editData();
            Navigator.of(context).pop(
              MaterialPageRoute(
                  builder: (BuildContext context) => Manage_Position()),
            );
          },
        ),
        new FlatButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  void editData() {
    var url =
        "${IP().connect}/updeta_sensor/${widget.list[widget.index]['sensor_id']}";
    http.put(Uri.parse(url), body: {
      "sensor_name": sensor_name.text,
    });
  }

  @override
  void initState() {
    sensor_name = TextEditingController(
        text: widget.list[widget.index]['sensor_name'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "แก้ไขของข้อมูลของ ${widget.list[widget.index]['sensor_name']}"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  // color: Colors.amber[600],
                  width: 350.0,
                  child: Column(
                    children: [
                      Container(
                        child: Text("แก้ไขของsensor"),
                      ),
                      TextField(
                        controller: sensor_name,
                        decoration: InputDecoration(
                            hintText:
                                "${widget.list[widget.index]['sensor_name']}",
                            labelText: "sensor"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 20,
            height: 60,
            child: FlatButton(
              // onPressed: () {
              //   confirm();
              // },
              onPressed: () {
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => new Manage_Sensor()),
                );
              },
              child: Text(
                'แก้ไขของข้อมูลสมาชิก',
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
