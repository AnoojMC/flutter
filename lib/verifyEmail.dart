import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

void main() {}

class verifyEmail extends StatefulWidget {
  String value;
  verifyEmail({Key key, @required this.value}) : super(key: key);
//  verifyEmail({Key key, @required this.data}) : super(key: key);

  @override
  _verifyEmailState createState() => _verifyEmailState(value);
}

class _verifyEmailState extends State<verifyEmail> {
  var _formKey = GlobalKey<FormState>();
  String value;
  _verifyEmailState(this.value);
  final otpCn1 = new TextEditingController();
  final otpCn2 = new TextEditingController();
  final otpCn3 = new TextEditingController();
  final otpCn4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'E-Mail bestätigen',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: new Image(image: AssetImage('images/emailVerify.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'Bitte gib den von uns gesendeten',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  'Bestätigungscode ein',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(1),
                              ],
                              controller: otpCn1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide())),
                              validator: (String value) {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(1),
                              ],
                              controller: otpCn2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide())),
                              validator: (String value) {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(1),
                              ],
                              controller: otpCn3,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide())),
                              validator: (String value) {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(1),
                              ],
                              controller: otpCn4,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide())),
                              validator: (String value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Code nicht angekommen',
                      style: TextStyle(fontSize: 15.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Code erneut senden',
                      style:
                          TextStyle(fontSize: 15.0, color: Colors.blueAccent)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: MaterialButton(
                    color: Colors.blueAccent.shade400,
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          submitFun();
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  submitFun() async {
    String otp;

    List<String> otpList = [];
    otpList.insert(0, otpCn1.text);
    otpList.insert(1, otpCn2.text);
    otpList.insert(2, otpCn3.text);
    otpList.insert(3, otpCn4.text);

    otp = otpList.join();
    var dataJson = {"email": value, "otp": otp};

    print(dataJson);
    var Emailres = await http.put("https://insure-tech-api.cadoangelus.me/auth",
        body: json.encode(dataJson),
        headers: {"Content-Type": "application/json"});
    print(json.decode(Emailres.body));
    var res = json.decode(Emailres.body);
    if (Emailres.statusCode == 200) {
      Alert(
              context: context,
              type: AlertType.success,
              title: "Success",
              desc: res['message'])
          .show();
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
