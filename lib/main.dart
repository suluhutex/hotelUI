import 'package:flutter/material.dart';

import 'auth/forgotpass.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'book/calendar.dart';
import 'lists/hotel_details.dart';
import 'lists/hotel_lists.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shower & Breakfast',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //accentColor: Color.fromRGBO(255, 138, 101, 1),
        accentColor: Colors.amber,
        fontFamily: 'PT Sans'
      ),
      home: SignUp(),
      routes: {
        '/hotellists': (context) => HotelLists(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/forgotpass' : (context) => ForgotPass(),
        '/hoteldetails' : (context) => HotelDetails(),
        '/calendar' : (context) => Calendar(),
      },
    );
  }
}

