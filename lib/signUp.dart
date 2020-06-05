import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'verifyEmail.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  var title, firstname, lastname, dob, email, mobile, password, passwordConfirm;
  final titleCon = new TextEditingController();
  final firstNameCon = new TextEditingController();
  final lastNameCon = new TextEditingController();
  final dobCon = new TextEditingController();
  final emailCon = new TextEditingController();
  final mobileCon = new TextEditingController();
  final passwordCon = new TextEditingController();
  final PassConfirmationCon = new TextEditingController();
  var _dateTime = new DateTime.now();
  bool swiched1 = true;
  bool switched2 = true;
  @override
  Widget build(BuildContext context) {
    var AnredeCn;
    var VornameCn;
    MaterialApp();
    return new Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: new Image(
                  image: new AssetImage('images/Trusthawk Final.png'),
                ),
              ),
              Center(
                child: new Text(
                  'Registrierung InsureTech',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 50, bottom: 5),
                child: Text(
                  'Anrede*',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 200, left: 10),
                child: TextFormField(
                  controller: titleCon,
                  decoration: InputDecoration(
//                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),

                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.transparent),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
//                      ),

                      hintText: "Herr",
                      filled: true,
                      fillColor: Colors.grey[200]),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the required field';
                    }
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      'Vorname*',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130, top: 30),
                    child: Text(
                      'Nachname*',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: firstNameCon,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.transparent),
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(30)),
//                            ),
                            hintText: "Max",
                            filled: true,
                            fillColor: Colors.grey[200]),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the required field';
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: lastNameCon,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.transparent),
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(30)),
//                            ),
                            hintText: "Mustermann",
                            filled: true,
                            fillColor: Colors.grey[200]),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the required field';
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Geburtsdatum*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dobCon,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: _dateTime,
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2021))
                        .then((date) {
                      setState(() {
                        _dateTime = date;
                        print(_dateTime);
                        dobCon.text =
                            DateFormat('MM.dd.yyyy').format(_dateTime);

//                        dobCon = _dateTime;
                      });
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.transparent),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
//                      ),
                      hintText: "e.g. 12,12,1980",
                      filled: true,
                      fillColor: Colors.grey[200]),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the required field';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'E-Mail-Address*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailCon,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.transparent),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
//                      ),
                      hintText: "e.g. hans.muster@axa.ch",
                      filled: true,
                      fillColor: Colors.grey[200]),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the required field';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Mobiltelefonnumber*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mobileCon,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.transparent),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
//                      ),
                      hintText: "e.g. 12,12,1980",
                      filled: true,
                      fillColor: Colors.grey[200]),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the required field';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Passwort*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordCon,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.transparent),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
//                      ),
//                      hintText: "e.g. 12,12,1980",
                      filled: true,
                      fillColor: Colors.grey[200]),
                  obscureText: true,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the required field';
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Passwort wiederholen*',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: PassConfirmationCon,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: Colors.transparent),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
//                      ),
//                      hintText: "e.g. 12,12,1980",
                      filled: true,
                      fillColor: Colors.grey[200]),
                  obscureText: true,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter the required field';
                    } else if (passwordCon.text != PassConfirmationCon.text) {
                      return 'Password does not match';
                    }
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Text('Ich stimme den'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: Text(
                      'Nutzungsbedingungen',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: Text('Zu'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: Switch(
                        value: swiched1,
                        onChanged: (value) {
                          setState(() {
                            swiched1 = value;
                          });
                        }),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text('Ich stimme der'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      'Datenschutzerklä',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('Zu'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Switch(
                        value: switched2,
                        onChanged: (value) {
                          setState(() {
                            switched2 = value;
                          });
                        }),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    color: Colors.blueAccent.shade400,
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          email = emailCon.text;
                          var data = {
                            "title": title = titleCon.text,
                            "firstName": firstNameCon.text,
                            "lastName": lastNameCon.text,
                            "dob": dob = dobCon.text,
                            "email": email,
                            "mobile": mobile = mobileCon.text,
                            "password": password = passwordCon.text,
                          };
                          passwordConfirm = PassConfirmationCon.text;
                          registration(data);
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
            ],
          ),
        ),
      ),
    );
  }

  registration(data) async {
    if (swiched1 == true && switched2 == true) {
      print(data);
      var emailjson = {"email": emailCon.text};

      var response = await http.post(
          "https://insure-tech-api.cadoangelus.me/user",
          body: json.encode(data),
          headers: {"Content-Type": "application/json"});

      var Emailres = http.patch("https://insure-tech-api.cadoangelus.me/auth",
          body: json.encode(emailjson),
          headers: {"Content-Type": "application/json"});
      print(Emailres);

      var stCode = response.statusCode;
      print(stCode);

      var res = json.decode(response.body);
      var alertType;
      print(res['message']);

      if (stCode == 200) {
//
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => verifyEmail(value: email)));
      } else {
        Alert(
                context: context,
                type: AlertType.error,
                title: "Retry",
                desc: res['message'])
            .show();
      }
    }
  }
}
