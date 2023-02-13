import 'package:provider/provider.dart';
import './home.dart';
import 'package:flutter/material.dart';

import '../data_models/users.dart';
import './toggler.dart';

class Handler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return Toggler();
    } else {
      return Home();
    }
  }
}
