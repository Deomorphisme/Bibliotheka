import 'package:bibliotheka/class.dart';
import 'package:bibliotheka/widgets/books_and_scrollers.dart';
import 'package:flutter/material.dart';
import 'package:bibliotheka/constants.dart';
import 'package:bibliotheka/widgets/rounded_button.dart';

class BookScreen extends StatelessWidget {
  final BorrowedBook book;

  const BookScreen({
    Key key,
    this.book,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/purple_desert.jpg'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * .1),
            Container(
              alignment: Alignment.centerLeft,
              height: 80,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(left: size.width * .05),
              decoration: BoxDecoration(/*color: Colors.white,*/ borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: [
                    TextSpan(text: 'Infos '),
                    TextSpan(
                      text: 'livre',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * .94,
              //height: 250,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


