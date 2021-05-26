import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_app/uitls/routes.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image_1.png",
                  fit: BoxFit.cover,
                  height: 300,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome \n$name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 13.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Not found";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          }),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Not found";
                          } else if (value.length < 8) {
                            return "At lest 8 charecter";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 25 : 7),
                        child: InkWell(
                          onTap: () => movetohome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changebutton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
