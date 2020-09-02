import 'package:avibebo/Screens/wrapper.dart';
import 'package:avibebo/models/appUser.dart';
import 'package:avibebo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<appUser>.value(
      value : AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


