import 'package:flutter/material.dart';
import 'package:hackathon_code_is_easy19/Markets.dart';

class ConsumerHomePage extends StatefulWidget {
  final String title;

  ConsumerHomePage({Key key, this.title}) : super(key: key);

  @override
  _ConsumerHomePageState createState() => _ConsumerHomePageState();
}

class _ConsumerHomePageState extends State<ConsumerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: Text('Consumer Home Page')),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text('Mercados'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MarketsPage();
                }));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ),
    );
  }
}
