import './login.dart';
import './register.dart';
import 'package:flutter/material.dart';

class Toggler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Toggler();
  }
}

class _Toggler extends State<Toggler> {
  bool showSignin = true;

  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return Login(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
