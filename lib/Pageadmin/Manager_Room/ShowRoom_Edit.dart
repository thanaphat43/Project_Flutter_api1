import 'package:day14/Pageadmin/Manager_Room/Edit_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../connect/ip.dart';

class Home_room_Edit extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home_room_Edit> {
  Future<List> getData() async {
    final responce = await http.get(Uri.parse("${IP().connect}/apistaff_room"));
    print(responce);
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShowRoom_Edit"),
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
          title: Text(list[i]['room_name']),
          // subtitle: Text(list[i]['mobile']),

          // onTap: () => Navigator.of(context).push(
          //   MaterialPageRoute(
          //     // builder: (BuildContext context) => Detail(list: list, index: i),
          //     // builder: (BuildContext context) => delete(),
          //     builder: (BuildContext context) =>
          //         Edit_room(list: list, index: i),
          //   ),
          // ),

          subtitle: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit_room(list: list, index: i),
                ),
              );
            },
            child: Text(
              'Edit_room',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );
      },
    );
  }
}
