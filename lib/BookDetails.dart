import 'package:flutter/material.dart';
import 'Book.dart';
import 'BookDetailsPage.dart';

class BookDetails extends StatelessWidget {
  final String bookname;
  final String bookauthor;
  final String bookcover;
  final int bookrating;
  final int bookviews;
  BookDetails({this.bookname,this.bookauthor,this.bookcover,this.bookviews,this.bookrating});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('book name is $bookname'),
        ),
//      child: Stack(
//        children: <Widget>[
//          Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(24.0),
//              image: DecorationImage(image: NetworkImage(bookcover),fit: BoxFit.fill),
//            ),
//          ),
//          Positioned(
//              left: 140.0,
//              top: 70.0,
//              child: Material(
//               // color: Colors.white,
//                elevation: 10.0,
//                borderRadius: BorderRadius.circular(24.0),
//                shadowColor: Color(0x802196F3),
//                child: Container(
//                  height: 150,
//                  width: 230,
//                  child: Column(
//                    children: <Widget>[
//                      SizedBox(height: 4,),
//                      Padding(
//                          padding: EdgeInsets.only(left: 8.0,right: 8.0),
//                        child: Container(
//                          child: Center(
//                            child: Text(bookname,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//                          ),
//                        ),
//                      ),
//                      SizedBox(height: 5,),
//                      Container(
//                        child: Center(
//                          child: Text(bookauthor,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                        ),
//                      ),
//                      SizedBox(height: 5,),
//                      Container(
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            Text(bookviews.toString() + " views",
//                                style: TextStyle(
//                                    color: Color(0xffff6f00), fontSize: 16.0)),
//                            IconButton(
//                                icon: Icon(
//                                 Icons.arrow_forward_ios,
//                                  color: Color(0xffff6f00),
//                                ),
//                                onPressed: () {
//                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsPage(index)));
//                                }),
//                          ],
//                        ),
//                      )
//
//                    ],
//                  ),
//
//                ),
//
//              )
//          )
//        ],
//      ),
    );
  }
}
