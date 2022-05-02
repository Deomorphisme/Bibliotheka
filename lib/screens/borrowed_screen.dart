import 'package:bibliotheka/class.dart';
import 'package:flutter/material.dart';
import 'package:bibliotheka/constants.dart';
import 'package:bibliotheka/widgets/rounded_button.dart';

class BorrowedReminder extends StatelessWidget {
  final Borrowing borrowing;

  const BorrowedReminder({
    Key key,
    this.borrowing,
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
                    TextSpan(text: 'Retardataire', style: Theme.of(context).textTheme.headline4),
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
                  CustomerInfo(customer: this.borrowing.customer),
                  BorrowingInfo(copy: this.borrowing.copy, borrowingDate: this.borrowing.borrowingDate, returningDate: this.borrowing.returningDate,),
                  BottomButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomerInfo extends StatelessWidget {
  final Customer customer;

  const CustomerInfo({
    Key key,
    this.customer,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: EdgeInsets.only(top: 10), child: Text('Client')),
        Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  image: DecorationImage(image: AssetImage(this.customer.photo), fit: BoxFit.cover,),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(offset: Offset(3,5),blurRadius: 33, color: kShadowColor),
                  ],
                ),
              ),
              VerticalDivider(width: 10,),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 17,),
                        children: [
                          TextSpan(text: this.customer.firstName+'\n', style: TextStyle(fontWeight: FontWeight.bold,)),
                          TextSpan(text: this.customer.lastName+'\n'),
                          TextSpan(text: this.customer.gender+'\n', style: TextStyle(fontSize: 13)),
                          TextSpan(text: this.customer.email+'\n', style: TextStyle(fontSize: 13)),
                          TextSpan(text: this.customer.phone, style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(indent: 20, endIndent: 20,),
      ],
    );
  }
}



class BorrowingInfo extends StatelessWidget {
  final Copy copy;
  final String borrowingDate, returningDate;

  const BorrowingInfo({
    Key key,
    this.copy,
    this.returningDate,
    this.borrowingDate,
  }):super(key: key);

  String get getReturningDate => (this.returningDate == null) ? 'null' : this.returningDate;
  String get getBorrowingDate => (this.borrowingDate == null) ? 'null' : this.borrowingDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: EdgeInsets.only(top: 10), child: Text('Exemplaire'),),
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * .9,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 17,),
                children: [
                  TextSpan(text: this.copy.getTitle+'\n', style: TextStyle(fontWeight: FontWeight.bold,)),
                  TextSpan(text: this.copy.getAuthor),
                  TextSpan(text: ' ('+this.copy.getYear+')'+'\n'),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * .5,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 17,),
                  children: [
                    TextSpan(text: 'Genre: '+this.copy.getGender+'\n', style: TextStyle(fontSize: 13)),
                    TextSpan(text: 'Edition: '+this.copy.getPublishing+'\n', style: TextStyle(fontSize: 13)),
                    TextSpan(text: 'Numero de serie: '+this.copy.getNumSerie+'\n', style: TextStyle(fontSize: 13)),
                    TextSpan(text: 'Date d\'emprunt: ' +this.getBorrowingDate+'\n', style: TextStyle(fontSize: 13)),
                    TextSpan(text: 'Date de retour: '+this.getReturningDate+'\n', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(image: AssetImage(this.copy.cover), fit: BoxFit.cover,),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(offset: Offset(3,5),blurRadius: 33, color: kShadowColor),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyFlatButtonWithoutSplash(
            color: Colors.black,
            text: 'Prolonger',
            height: 50,
            minWidth: size.width * .47,
          ),
          MyFlatButton(
            text: 'Rendre',
            height: 50,
            minWidth: size.width * .47,
          ),
        ],
      ),
    );
  }
}
