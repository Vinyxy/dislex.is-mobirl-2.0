import 'package:dislexiamobile/telas/calendario/calendario.dart';
import 'package:dislexiamobile/telas/home/home.dart';
import 'package:dislexiamobile/telas/register/register.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'telas/login/login.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DislexiaSplash extends StatefulWidget {
  const DislexiaSplash({Key? key}) : super(key: key);

  @override
  _DislexiaSplashState createState() => _DislexiaSplashState();
}

class _DislexiaSplashState extends State<DislexiaSplash> {
  void didChangeDependencie() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Image.asset('assets/images/DislexIA.png')),
    );
  }
}
