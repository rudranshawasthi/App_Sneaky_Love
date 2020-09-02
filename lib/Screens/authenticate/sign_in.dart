import 'package:avibebo/services/auth.dart';
import 'package:avibebo/shared/InputDecoration.dart';
import 'package:avibebo/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email;
  String password;
  String error= '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text(
            'Sign In'
        ),
        actions: [
          FlatButton(
            color: Colors.pink[400],
            onPressed: () {
              widget.toggleView();
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
          )
        ],
        backgroundColor: Colors.pink[300],
      ),
      backgroundColor: Colors.pink[50],
      body: ListView(
        padding: EdgeInsets.only(top: 100),
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(50, 140, 50, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val)  => val.isEmpty ? 'enter email' : null,
                        onChanged: (val) => email = val,
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val)  => val.length < 8 ? 'Password too short' : null,
                        onChanged: (val) => password = val,
                      ),
                      SizedBox(height: 15,),
                      RaisedButton(
                        padding: EdgeInsets.all(12),
                        color: Colors.pink[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.purple[900])
                        ),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.signIn(email, password);
                            if(result==null){
                              setState(() {
                                error = 'Invalid Email or Password';
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text(error,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18
                        ),)
                    ],
                  )
              ),
            )
          ],
        ),
    );
  }
}
