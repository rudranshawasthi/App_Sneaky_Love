import 'package:avibebo/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text('Sneaky Love'),
        actions: [
          FlatButton(
              onPressed: () async{
                await _auth.signOut();
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
          )
        ],
      ),
    );
  }
}
