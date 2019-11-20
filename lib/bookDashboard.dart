import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Book.dart';
import 'package:simple_futurebuilder/BookDetails.dart';

class BookDashboard extends StatefulWidget {
  BookDashboard({Key key}) : super(key: key);

  @override
  _BookDashboardState createState() => _BookDashboardState();
}

class _BookDashboardState extends State<BookDashboard> {
  List<Books> booklists = [];

  Future<List<Books>> _bookDetails() async {
    var respnonseurl =
        await http.get("https://my.api.mockaroo.com/books.json?key=3c694760");
    var jsonData = json.decode(respnonseurl.body);

    for (var bookval in jsonData) {
      Books _books = Books(
          bookval['bookname'],
          bookval['bookauthor'],
          bookval['bookcover'],
          bookval['bookrating'],
          bookval['bookviews'],
          bookval['bookdetails']);
      booklists.add(_books);
    }
    return booklists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple  FutureBuilder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Books>>(
                future: _bookDetails(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  if(snapshot.connectionState == ConnectionState.done){
                    if (snapshot.data != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BookDetails(
                              //snapshot.data[index]
                              index: snapshot.data[index],
                              bookauthor: snapshot.data[index].bookauthor,
                              bookcover: snapshot.data[index].bookcover,
                              bookname: snapshot.data[index].bookname,
                              bookrating: snapshot.data[index].bookrating,
                              bookviews: snapshot.data[index].bookviews,
                            );
                          });
                    }else{
                      return Center(
                        child: Text('error'),
                      );
                    }
                  } else {
                    return Container(
                      child: Center(
                        child: Text("Loading..."),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
