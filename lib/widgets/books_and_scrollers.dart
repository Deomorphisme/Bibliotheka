import 'package:bibliotheka/screens/book_screen.dart';
import 'package:bibliotheka/screens/borrowed_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bibliotheka/constants.dart';
import 'package:flutter/painting.dart';

import '../class.dart';

class BorrowedBook extends StatelessWidget {
  final context;
  final String title;
  final String author;
  final int year;
  final String gender;
  final String summary;
  final String cover;
  final bool liked;
  final double rating;

  const BorrowedBook({
    Key key,
    this.context,
    this.author,
    this.title,
    this.summary,
    this.cover,
    this.liked,
    this.rating,
    this.year,
    this.gender,
  }) : super(key: key);

  press(){
    Navigator.push(this.context, MaterialPageRoute(builder: (context) {
      return BookScreen(
        book: this,
      );
    }));
  }

  String rightAuthorNameLength(){
    if (this.author.length > 20){
      return this.author.substring(0,20)+'...';
    }
    return this.author;
  }

  String rightBookTitleLength(int len){
    if (this.title.length > len){
      return this.title.substring(0,len)+'...';
    }
    return this.title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,50,0,0),
      child: Container(
          height: 245,
          width: 200,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 225,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5,8),
                        blurRadius: 10,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                ),

                //Le coeur et la note

                Positioned(
                  top: 25,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(icon: this.liked ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border), onPressed: (){}),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3,7),
                              color: Color(0xFFD3D3D3).withOpacity(.5),
                              blurRadius: 20
                            )
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: kIconColor,
                              size: 10,
                            ),
                            Text(
                              this.rating.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //la premiere de couverture du livre

                Positioned(
                  top: -35,
                  left: 20,
                  height: 145,
                  width: 120,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(this.cover),
                            fit: BoxFit.cover
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.zero,
                              color: kShadowColor,
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: Container(
                    height: 110,
                    width: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          maxLines: 3,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                text: rightAuthorNameLength()+'\n',
                              ),
                              TextSpan(
                                style: TextStyle(
                                  color: kLightColor,
                                ),
                                text: rightBookTitleLength(40),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: FlatButton(
                            height: 50,
                            minWidth: 120,
                            //padding: EdgeInsets.symmetric(vertical: 10),
                            color: Color(0xFFC4C4FC),
                            splashColor: Color(0xFF81A3FE),
                            child: Text('Détails',style: TextStyle(color: Colors.white, fontSize: 15),),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                            onPressed: press,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
          ),
      ),
    );
  }
}

class BookScroller extends StatelessWidget {
  final List<BorrowedBook> children;

  const BookScroller({
    Key key,
    this.children,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            'Les 10 derniers livres empruntés',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 300,
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: this.children,
            ),
          ),
        ),
      ],
    );
  }
}

class DaysBook extends StatelessWidget {
  final BorrowedBook daysBook;

  const DaysBook({
    Key key,
    this.daysBook,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 30, bottom: 30),
          width: MediaQuery.of(context).size.width * .8,
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline4,
              children: [
                TextSpan(text: 'Le livre du '),
                TextSpan(
                  text: 'jour',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .94,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                top: -20,
                right: 25,
                height: 145 * 1.2,
                width: 120 * 1.2,
                /// premiere de couverture
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(this.daysBook.cover), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(offset: Offset(3,5),blurRadius: 20,color: kLightColor.withOpacity(.7)),
                    ],
                  ),
                ),
              ),

              /// titre et nom de l'auteur
              Positioned(
                top: 35,
                left: 25,
                width: 170,
                height: 120,
                child: Container(
                  //color: Colors.blueGrey.shade200,
                  child: RichText(
                    //textAlign: TextAlign.justify,
                    maxLines: 5,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,),
                          text: this.daysBook.rightBookTitleLength(54) + '\n',
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                          text: this.daysBook.rightAuthorNameLength(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: FlatButton(
                  minWidth: 100,
                  height: 50,
                  //padding: EdgeInsets.symmetric(vertical: 10),
                  color: kThemeLightColor,
                  splashColor: kThemeDarkerColor,
                  child: Text('Détails',style: TextStyle(color: Colors.white, fontSize: 15),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30))),
                  onPressed: daysBook.press,
                ),
              ),

              Positioned(
                bottom: 10,
                left: 25,
                width: 340,
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// le résumé
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 9),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(3,7),
                              color: Color(0xFFD3D3D3).withOpacity(.5),
                              blurRadius: 20
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: kIconColor,
                            size: 15,
                          ),
                          Text(
                            this.daysBook.rating.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),

                    /// Icon star et la note
                    Container(
                      width: 200,
                      //color: Colors.blueGrey.shade200,
                      child: RichText(
                        //textAlign: TextAlign.start,
                        maxLines: 5,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.caption,
                          children: [
                            TextSpan(
                              style: TextStyle(fontSize: 10, color: kLightColor),
                              text: this.daysBook.summary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MainScroller extends StatelessWidget {
  final List<Widget> children;

  const MainScroller({
    Key key,
    this.children,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this.children,
      ),
    );
  }
}

class LateCustomerCard extends StatelessWidget {
  final context;
  final String customerFirstName;
  final String customerLastName;
  final String customerGender;
  final String customerPhone;
  final String customerEmail;
  final String customerPhotoPath;
  final String customerTitle;
  final String customerReturningDate;
  final String customerBorrowingDate;
  final String author, year, gender, publishing, cover, numPages, numSerie;

  LateCustomerCard({
    Key key,
    this.context,
    this.customerFirstName,
    this.customerLastName,
    this.customerGender,
    this.customerPhone,
    this.customerEmail,
    this.customerPhotoPath,
    this.customerTitle,
    this.customerReturningDate,
    this.customerBorrowingDate,
    this.author, this.year, this.gender, this.publishing, this.cover, this.numPages, this.numSerie
  }):super(key: key);

  press(){
    Navigator.push(this.context, MaterialPageRoute(builder: (context) {
      return BorrowedReminder(borrowing: Borrowing(
        borrowingDate: this.customerBorrowingDate,
        returningDate: this.customerReturningDate,
        copy: Copy(
          title: this.customerTitle,
          author: this.author,
          year: this.year,
          gender: this.gender,
          publishing: this.publishing,
          cover: this.cover,
          numPages: this.numPages,
          numSerie: this.numSerie,
        ),
        customer: Customer(
            firstName: this.customerFirstName,
            lastName: this.customerLastName,
            gender: this.customerGender,
            phone: this.customerPhone,
            email: this.customerEmail,
            photo: this.customerPhotoPath
        ),
      ),);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 50,
                  //height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    image: DecorationImage(image: AssetImage(this.customerPhotoPath), fit: BoxFit.cover,),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(offset: Offset(3,5),blurRadius: 10, color: kShadowColor),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(text: this.customerFirstName+'\n', style: Theme.of(context).textTheme.bodyText1),
                          TextSpan(text: this.customerLastName+'\n', style: Theme.of(context).textTheme.bodyText2),
                          TextSpan(text: this.customerGender+'\n', style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                  ),
                ),
                VerticalDivider(width: 10,),
                Container(
                  width: 130,
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Emprunt : 15/10/20\n', style: Theme.of(context).textTheme.caption),
                        TextSpan(text: 'Retour : Hier\n', style: Theme.of(context).textTheme.caption),
                        TextSpan(text: 'Livre : ${this.customerTitle}', style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 0, indent: 20, endIndent: 20,)
      ],
    );
  }
}

class CustomersOnLate extends StatelessWidget {
  final List<LateCustomerCard> children;

  const CustomersOnLate({
    Key key,
    this.children,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 30, bottom: 30),
          width: MediaQuery.of(context).size.width * .8,
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline4,
              children: [
                TextSpan(text: 'Les clients en '),
                TextSpan(
                  text: 'retard',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .94,
          //height: 250,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: this.children,
          ),
        ),
      ],
    );
  }
}
