import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final double imgHeight;
  HeroImage({this.imgHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/intro11.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText, this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onBtnPressed,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              btnText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  final String iconname;
  SocialIcons({this.iconname});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(iconname),
      width: 40.0,
      height: 40.0,
    );
  }
}
