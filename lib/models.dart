import 'package:flutter/cupertino.dart';

class PopularBooks {
  final NetworkImage coverPhoto;
  final String title;
  final String rating;
  final String author;

  PopularBooks({this.coverPhoto, this.title, this.rating, this.author});
}
