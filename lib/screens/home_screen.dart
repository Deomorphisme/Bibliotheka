import 'package:bibliotheka/class.dart';
import 'package:bibliotheka/constants.dart';
import 'package:bibliotheka/widgets/books_and_scrollers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kThemeDarkerColor,
        child: IconButton(
          icon: Icon(Icons.add,),
          onPressed: (){},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * .1),
            ///Welcome message
            Container(
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(/*color: Colors.white,*/ borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: [
                    TextSpan(text: 'Un nouvel emprunt '),
                    TextSpan(
                      text: 'aujourd\'hui?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: 30),
            Expanded(
              child: MainScroller(
                children: [
                  BookScroller(
                    children: [
                      BorrowedBook(
                        context: context,
                        author: 'Deo Gracias',
                        title: "L'art de l'attachement ou comment se po sur ses amis",
                        cover: 'assets/images/blackwoods.jpg',
                        rating: 5,
                        liked: false,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'Arouna Hassane',
                        title: "Le binaire Tome I",
                        cover: 'assets/images/sunset.jpg',
                        rating: 5,
                        liked: false,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'Charles Henri',
                        title: "Comment nager efficacement ?",
                        cover: 'assets/images/michael_phelps.jpg',
                        rating: 9.9,
                        liked: true,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'The Binks',
                        title: "Les topos du binksage",
                        cover: 'assets/images/ketchi.jpg',
                        rating: 2.7,
                        liked: false,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'Serge',
                        title: "Fake news, les principes",
                        cover: 'assets/images/brenda.jpg',
                        rating: 6.5,
                        liked: false,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'Sito',
                        title: "Comment savoir qu'on crush ?",
                        cover: 'assets/images/sito.jpg',
                        rating: 5,
                        liked: true,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'Baratheon',
                        title: "Guide d'une belle vie",
                        cover: 'assets/images/astro.jpg',
                        rating: 5.0,
                        liked: true,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'velou',
                        title: "Manger et se faire manger à son tour",
                        cover: 'assets/images/loup.jpg',
                        rating: 7.1,
                        liked: false,
                      ),
                      BorrowedBook(
                        context: context,
                        author: 'Gilou',
                        title: 'Tout En Un mercato',
                        cover: 'assets/images/mercato.jpg',
                        rating: 5,
                        liked: true,
                      )
                    ],
                  ),
                  DaysBook(
                    daysBook: BorrowedBook(
                      author: 'Deo Gracias',
                      title: "L'art de l'attachement ou comment se po sur ses amis ?",
                      summary: "Cet ouvrage vous guidera dans votre recherche de la bonne humeur par l'attachement. Vous fournissant, méthodes, techniques et exercices pratiques pour faire de vous un maître attacheur." ,
                      cover: 'assets/images/blackwoods.jpg',
                      rating: 5,
                      liked: false,
                      context: context,
                    ),
                  ),
                  CustomersOnLate(
                    children: [
                      LateCustomerCard(
                        context: context,
                        customerFirstName: 'Marie-Christ Sitael',
                        customerLastName: 'Gauga',
                        customerGender: 'Homme',
                        customerEmail: 'sito.de.gozo@inphb.ci',
                        customerPhone: '47292534',
                        customerPhotoPath: 'assets/images/sito.jpg',
                        customerTitle: 'Comment nager efficacement ?',
                        cover: 'assets/images/michael_phelps.jpg',
                        author: 'Charles Henri',
                        year: '2019',
                        gender: Gender.horreur.about,
                        publishing: 'folio adulte',
                        numSerie: '978-2-07-510447-0',
                        customerBorrowingDate: 'xx/xx/xx',
                        customerReturningDate: 'xx/xx/xx',
                      ),
                      LateCustomerCard(
                        context: context,
                        customerFirstName: 'Deo Gracias',
                        customerLastName: 'Sekongo',
                        customerGender: 'Homme',
                        customerEmail: 'gracias.sekongo@inphb.ci',
                        customerPhone: '40844335',
                        customerPhotoPath: 'assets/images/chouchou.jpg',
                        customerTitle: 'Le binaire Tome I',
                        cover: 'assets/images/sunset.jpg',
                        author: 'Arouna Hassane',
                        year: '2018',
                        gender: Gender.policier.about,
                        publishing: 'FLAMARION',
                        numSerie: '978-2-290-20969-1',
                        customerBorrowingDate: 'xx/xx/xx',
                        customerReturningDate: 'xx/xx/xx',
                      ),
                      LateCustomerCard(
                        context: context,
                        customerFirstName: 'Brenda Etma Charron',
                        customerLastName: 'Amon',
                        customerGender: 'Femme',
                        customerEmail: 'brenda.amon@inphb.ci',
                        customerPhone: '53826488',
                        customerPhotoPath: 'assets/images/brenda.jpg',
                        customerTitle: 'Guide d\'une belle vie',
                        cover: 'assets/images/astro.jpg',
                        author: 'Baratheon',
                        year: '2020',
                        gender: Gender.romance.about,
                        publishing: 'J\'AI LU',
                        numSerie: '978-2-07-510447-0',
                        customerBorrowingDate: 'xx/xx/xx',
                        customerReturningDate: 'xx/xx/xx',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
