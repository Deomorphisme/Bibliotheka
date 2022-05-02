import 'package:flutter/foundation.dart';

class Customer{
  String lastName, firstName, gender, phone, email, photo;

  Customer({this.lastName, this.firstName, this.gender, this.phone, this.email, this.photo});
}

class Book{
  String title, author, year, gender, summary, cover;

  Book({this.title, this.author, this.year, this.gender, this.summary, this.cover});

  String get getAuthor => (this.author == null) ? 'Null' : this.author ;
  String get getTitle => (this.title == null) ? 'Null' : this.title ;
  String get getYear => (this.year == null) ? 'Null' : this.year ;
  String get getGender => (this.gender == null) ? 'Null' : this.gender ;
  String get getSummary => (this.summary == null) ? 'Null' : this.summary ;
}

enum Gender{
  aventure,
  policier,
  romance,
  science_fiction,
  horreur
} extension genderExt on Gender{
  static const genderMap = {
    Gender.aventure: "Aventure",
    Gender.policier: "Policier",
    Gender.romance: "Romance",
    Gender.science_fiction: "Science fiction",
    Gender.horreur : "Horreur",
  };

  String get about => genderMap[this];
}

class Copy extends Book {
  String publishing, numPages, numSerie;

  Copy({
    title,
    author,
    year,
    gender,
    summary,
    cover,
    this.publishing,
    this.numPages,
    this.numSerie
  }):super(title: title, author: author, year: year, gender: gender, summary: summary, cover: cover);

  String get getPublishing => (this.publishing == null) ? 'Null' : this.publishing ;
  String get getNumSerie => (this.numSerie == null) ? 'Null' : this.numSerie ;
}

class Borrowing{
  String borrowingDate, returningDate;
  Customer customer;
  Copy copy;

  Borrowing({this.borrowingDate, this.returningDate, this.customer, this.copy});
}