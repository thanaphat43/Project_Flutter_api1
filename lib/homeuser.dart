import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:day14/Animation/FadeAnimation.dart';
import 'package:day14/Weather/utils/weather.dart';
import 'package:day14/pageUser/LoginUser.dart';
import 'package:day14/pageUser/home.dart';
import 'package:day14/pageUser/screens/launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Weather/constants.dart';
import './Weather/utils/weather.dart';
import 'connect/ip.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class HomeUser extends StatefulWidget {
  HomeUser({@required this.weatherData});

  final WeatherData weatherData;

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeUser> {
  int temperature;
  Icon weatherDisplayIcon;
  AssetImage backgroundImage;
  int id_position;
  int id_staff;
  String first_name;
  dynamic token2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();
  }

  Future getUser() async {
    // ignore: unused_local_variable
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String token = await firebaseMessaging.getToken();
    print("Token==${token}");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        id_staff = preferences.getInt('id_staff');
        id_position = preferences.getInt('id_position');
        first_name = preferences.getString('first_name');
        token2 = token;
        print('id_position $id_position');
      },
    );
    if (id_staff != null) {
      String apiurl = "${IP().connect}/updeta_token_staff/${id_staff}/${token}";
      await http.put(Uri.parse(apiurl));
      print('id_staff $id_staff');
      print('id_staff $token');
    }
    updateDisplayInfo(widget.weatherData);
    // gettemp();
  }

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900],
          Colors.orange[800],
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: weatherDisplayIcon,
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      ' $temperature°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Launcher(),
            )
          ],
        ),
      ),
    );
  }
}
