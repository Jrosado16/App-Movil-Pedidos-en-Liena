import 'package:app_movil/src/Pages/Count/Count.dart';
import 'package:app_movil/src/Pages/Home/Init.dart';
import 'package:app_movil/src/Pages/Information/Infromation.dart';
import 'package:flutter/material.dart';

import 'src/Pages/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/init',
      routes: {
        '/'               : (_) => Home(),
        '/count'          : (_) => Count(),
        '/information'    : (_) => Information(),
        '/init'           : (_) => Init()
      },
    );
  }
}
