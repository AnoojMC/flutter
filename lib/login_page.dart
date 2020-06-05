import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'signUp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var stCode;
  var email;
  var password;
  final emailCon = new TextEditingController();
  final passwordCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: new Image(
                      image: new AssetImage('images/Trusthawk Final.png'),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'TrustHawk Login',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox.fromSize(),
                Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: Container(
                    child: new Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: 210.0),
                            child: Text('E-Mail-Address',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            controller: emailCon,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter the required field';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
//                                focusedBorder: OutlineInputBorder(
//                                  borderSide:
//                                      BorderSide(color: Colors.transparent),
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(30)),
//                                ),
                                hintText: "Enter Email",
                                filled: true,
                                fillColor: Colors.grey[200]),
                          ),
                        ),
                        SizedBox.fromSize(),
                        Padding(
                          padding: EdgeInsets.only(left: 48.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('Passwort',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: SelectableText(
                                  'Passwort vergessen?',
                                  enableInteractiveSelection: false,
                                  onTap: () => {
                                    print('hi'),
                                  },
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade700,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            controller: passwordCon,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter the required field';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
//                                focusedBorder: OutlineInputBorder(
//                                  borderSide:
//                                      BorderSide(color: Colors.transparent),
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(30)),
//                                ),
                                hintText: "Enter Password",
                                filled: true,
                                fillColor: Colors.grey[200]),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Center(
                            child: MaterialButton(
                              color: Colors.blueAccent.shade400,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    email = emailCon.text;
                                    password = passwordCon.text;
                                    logIn(email, password);
                                  }
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              minWidth: 380.0,
                              height: 50,
                              child: Text(
                                'WEITER',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Container(
                            child: new InkWell(
                              child: Text(
                                'JETZT REGISTRIEREN',
                                style: TextStyle(
                                    color: Colors.blueAccent.shade400,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
//                              print('hellow');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logIn(String email, String password) async {
    print(email);
    print(password);
    var data = {
      "email": email,
      "password": password,
    };

    print(data);
    var response = await http.post(
        "https://insure-tech-api.cadoangelus.me/auth",
        body: json.encode(data),
        headers: {"Content-Type": "application/json"});
//    print(response.statusCode);
    stCode = response.statusCode;
    print(stCode);
    if (stCode != 200) {
      showAlert();
    }
  }

  showAlert() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "INVALID USER",
      desc: "Your entered invalid username or password.",
      buttons: [
        DialogButton(
          child: Text(
            "Retry",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
