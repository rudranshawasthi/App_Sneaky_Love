import 'package:avibebo/Screens/Home/home.dart';
import 'package:avibebo/Screens/authenticate/authenticate.dart';
import 'package:avibebo/models/appUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<appUser>(context);

    return user == null ? Authenticate() : Home();
  }
}
