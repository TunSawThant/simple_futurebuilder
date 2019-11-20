import 'package:flutter/material.dart';
import 'Book.dart';
import 'BookDetailsPage.dart';

class BookDetails extends StatelessWidget {
  Books index;
  final String bookname;
  final String bookauthor;
  final String bookcover;
  final int bookrating;
  final int bookviews;
  BookDetails({this.index,this.bookname,this.bookauthor,this.bookcover,this.bookviews,this.bookrating});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
            children: <Widget>[
              Container(
                width: 250.0,
                height: 270.0,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  image: DecorationImage(
                    image: new NetworkImage(bookcover),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 140.0,
                top: 70.0,
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      width: 230.0,
                      height: 150.0,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                              child: Center(
                                  child: Text(bookname,
                                      style: TextStyle(
                                          color: Color(0xff07128a),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: Center(
                                child: Text(bookauthor,
                                    style: TextStyle(
                                        color: Color(0xff2da9ef),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(bookviews.toString() + " views",
                                      style: TextStyle(
                                          color: Color(0xffff6f00), fontSize: 16.0)),
                                  IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xffff6f00),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsPage(index)));
                                      }),
                                ],
                              )),
                        ],
                      ),
                    )),
              ),
            ]),
    );
  }
}
