import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double verticalPadding;
  final double fontSize;
  RoundedButton({
    Key key,
    this.text,
    this.press,
    this.verticalPadding = 16,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center ,
        margin: EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 30,
                  color: Color(0xFF666666).withOpacity(.33))
            ]),
        child: Text(text,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class MyFlatButton extends StatelessWidget {
  final String text;
  final double height;
  final double minWidth;

  const MyFlatButton({Key key, this.text, this.height, this.minWidth}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: this.minWidth,
      height: this.height,
      //padding: EdgeInsets.symmetric(vertical: 10),
      color: kThemeLightColor,
      splashColor: kThemeDarkerColor,
      child: Text(this.text,style: TextStyle(color: Colors.white, fontSize: 15),),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30))),
      onPressed: (){},
    );
  }
}

class MyFlatButtonWithoutSplash extends StatelessWidget {
  final String text;
  final double height;
  final double minWidth;
  final Color color;

  const MyFlatButtonWithoutSplash({Key key, this.text, this.height, this.minWidth, this.color}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: this.color,
      minWidth: this.minWidth,
      height: this.height,
      //padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(this.text,style: TextStyle(fontSize: 15),),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), topRight: Radius.circular(30))),
      onPressed: (){},
    );
  }
}