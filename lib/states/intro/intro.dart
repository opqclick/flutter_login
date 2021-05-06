import 'package:flutter/material.dart';
import 'package:motorzan/states/auth/login.dart';
import 'package:motorzan/widgets/custom_widgets.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: HeroImage(
              imgHeight: MediaQuery.of(context).size.height * 0.7,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'MotorZan',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'You online solution',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    CustomButton(
                      btnText: 'Getting Started',
                      onBtnPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Login();
                          }),
                        );
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
