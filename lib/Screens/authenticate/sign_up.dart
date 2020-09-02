import 'package:avibebo/services/auth.dart';
import 'package:avibebo/shared/InputDecoration.dart';
import 'package:avibebo/shared/loading.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  bool loading = false;
  String error= '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up'
        ),
        actions: [
          FlatButton(
            color: Colors.pink[400],
            onPressed: () {
              widget.toggleView();
            },
            child: Text(
              'Log In',
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
      body:ListView(
          padding: EdgeInsets.only(top: 100),
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
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
                        decoration: textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val)  => val.length < 8 ? 'Password too short' : null,
                        onChanged: (val) => password = val,
                      ),
                      // SizedBox(height: 15,),
                      // TextFormField(
                      //   decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                      //   validator: (val)  => val==password  ? "Password Doesn't Match" : null,
                      //   onChanged: (val) => password = val,
                      // ),
                      SizedBox(height: 15,),
                      RaisedButton(
                        padding: EdgeInsets.all(12),
                        color: Colors.pink[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.pink[500])
                        ),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.signUp(email, password);
                            if(result ==null){
                              setState(() {
                                error = 'Invalid Email';
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
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
