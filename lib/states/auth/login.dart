import 'package:flutter/material.dart';
import 'package:motorzan/pages/home.dart';
import 'package:motorzan/services/api.dart';
import 'package:motorzan/widgets/custom_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          HeroImage(
            imgHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(message),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Mobile',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        controller: mobileController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Mobile cannot be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 20.0)),
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('New user?'),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                        btnText: 'Login',
                        onBtnPressed: () async {
                          if (_formKey.currentState.validate()) {
                            var mobile = mobileController.text;
                            var password = passwordController.text;

                            setState(() {
                              message = 'Please wait..';
                            });

                            var resp = await loginUser(mobile, password);
                            print(resp);

                            if (resp.containsKey('status')) {
                              setState(() {
                                message = 'Logged in..';
                              });
                              if (resp['status'] == 1) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(
                                    username: resp['username'],
                                  );
                                }));
                              }
                            } else {
                              setState(() {
                                message = 'Login failed!';
                              });
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
