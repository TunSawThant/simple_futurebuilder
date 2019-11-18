import 'package:flutter/material.dart';
import 'Book.dart';

class BookDetailsPage extends StatelessWidget {
  final Books books;
  BookDetailsPage(this.books);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(books.bookname),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(books.bookcover),fit: BoxFit.fill)
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8.0),
            child: Text(books.bookdetails,style: TextStyle(fontSize: 16.0),),
          )
        ],
      ),
    );
  }
}
