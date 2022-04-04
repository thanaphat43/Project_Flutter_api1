import 'package:day14/Pageadmin/Manager_User/editdata.dart';
import 'package:day14/Pageadmin/Manager_User/newdata.dart';
import 'package:day14/Pageadmin/Manager_position/edit_position.dart';
import 'package:day14/Pageadmin/Manager_sensor/edit_sensor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_mysql_crud/details.dart';
// import 'package:flutter_mysql_crud/page1/login.dart';
// import 'package:flutter_mysql_crud/pageAdmin/Mamager_User/editdata.dart';
// import 'package:flutter_mysql_crud/pageAdmin/Mamager_User/newdata.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../connect/ip.dart';

// void main() => runApp(MaterialApp(
//       title: "Api Test",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: LoginPage(),
//     ));

class Show_Edit_sensor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Show_Edit_sensor> {
  Future<List> getData() async {
    final responce = await http.get(Uri.parse("${IP().connect}/sensor"));
    print(responce);
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แสดงข้อมูลของเครื่องวัดอุณหภูมิ(sensor)และแก้ไข"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext contex) => AddData(),
          ),
        ),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("error");
          }
          if (ss.hasData) {
            return Items(list: ss.data);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          leading: Icon(Icons.person),
          title: Text(list[i]['sensor_name']),
          // subtitle: Text(list[i]['mobile']),

          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  Edit_sensor(list: list, index: i),
            ),
          ),

          subtitle: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit_sensor(list: list, index: i),
                ),
              );
            },
            child: Text(
              'แก้ไขเครื่องวัดอุณหภูมิ(sensor)',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );
      },
    );
  }
}
