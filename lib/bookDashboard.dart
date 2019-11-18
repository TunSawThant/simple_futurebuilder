import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Book.dart';
import 'package:simple_futurebuilder/BookDetails.dart';

class BookDashboard extends StatefulWidget {
  BookDashboard({Key key}):super(key:key);
  @override
  _BookDashboardState createState() => _BookDashboardState();
}

class _BookDashboardState extends State<BookDashboard> {

List<Books> booklists=[];

Future<List<Books>> _bookDetails() async{
  var respnonseurl=await http.get("https://my.api.mockaroo.com/books.json?key=3c694760");
  var jsonData=json.decode(respnonseurl.body);

  for(var bookval in jsonData){
    Books _books=Books(bookval['bookname'], bookval['bookauthor'], bookval['bookcover'],
        bookval['bookrating'], bookval['bookviews'], bookval['bookdetails']);
    booklists.add(_books);
  }

  return booklists;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            FutureBuilder(
              future:_bookDetails() ,
                builder: (BuildContext context,AsyncSnapshot snapshot ){
                if(snapshot.data !=null){
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context,int i){
                        print("Hello..."+snapshot.data[i].length);
                        return BookDetails(
                            snapshot.data[i],
                            snapshot.data[i].bookname,
                            snapshot.data[i].bookauthor,
                            snapshot.data[i].bookcover,
                            snapshot.data[i].bookviews,
                            snapshot.data[i].bookrating
                        );
                        }
                    ),
                  );
                }
                else
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
