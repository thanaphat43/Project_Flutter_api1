import 'package:day14/Pageadmin/Manager_User/editdata.dart';
import 'package:day14/Pageadmin/Manager_User/newdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../connect/ip.dart';

class Home3 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home3> {
  Future<List> getData() async {
    final responce = await http.get(Uri.parse("${IP().connect}/apistaff"));
    print(responce);
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Bar"),
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
          title: Text(list[i]['username']),
          // subtitle: Text(list[i]['mobile']),

          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              // builder: (BuildContext context) => Detail(list: list, index: i),
              // builder: (BuildContext context) => delete(),
              builder: (BuildContext context) => Edit(list: list, index: i),
            ),
          ),

          subtitle: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(list: list, index: i),
                ),
              );
            },
            child: Text(
              '???????????????',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        );
      },
    );
  }
}
