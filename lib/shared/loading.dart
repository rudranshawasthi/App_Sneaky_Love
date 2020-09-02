import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: SpinKitPumpingHeart(
            color: Colors.redAccent,
            size: 100.0,
          )
      ),
    );
  }
}

