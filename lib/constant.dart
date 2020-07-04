import 'package:flutter/material.dart';
import 'models.dart';

var userName = "Dimest";
Color backgroundColor = Colors.amber;

var currentPageValue = 0.0;
var currentPageIndex = 0;
final controller = PageController(initialPage: 0);

List popularBooks = [
  PopularBooks(
      coverPhoto: NetworkImage(
          "https://www.stylist.co.uk/images/app/uploads/2011/10/11131249/81v5wp2zeql.jpg?w=568&h=1&fit=max&auto=format%2Ccompress"),
      title: "All The Light We Cannot See",
      author: "Anthony Doerr",
      rating: "4.9"),
  PopularBooks(
      coverPhoto: NetworkImage(
          "https://imgix.bustle.com/uploads/image/2018/7/27/685e6aa2-657e-4f9e-8bca-e2502425cf67-to-kill-a-mockingbird-cover-big.jpg"),
      title: "To Kill A Mockingbird",
      author: "Harper Lee",
      rating: "4.9"),
  PopularBooks(
      coverPhoto: NetworkImage(
          "https://i2.wp.com/bestlifeonline.com/content/uploads/2018/05/the-da-vinci-code-book-cover.jpg?resize=1024%2C1903&ssl=1"),
      title: "The Da Vinci Code",
      author: "Dan Brown",
      rating: "4.8"),
  PopularBooks(
      coverPhoto:
          NetworkImage("https://m.media-amazon.com/images/I/41QlgiuLl5L.jpg"),
      title: "The Kite Runner",
      author: "Khaled Hosseini",
      rating: "4.8"),
  PopularBooks(
      coverPhoto: NetworkImage(
          "https://www.amreading.com/wp-content/uploads/lord-of-the-flies1.jpg"),
      title: "The Lord Of The Flies",
      author: "Wiliam Golding",
      rating: "4.8"),
  PopularBooks(
      coverPhoto: NetworkImage(
          "https://images-na.ssl-images-amazon.com/images/I/81X8aNbMxcL.jpg"),
      title: "After Even Happy",
      author: "Anna Todd",
      rating: "4.6"),
];
