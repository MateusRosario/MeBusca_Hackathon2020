import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: Container(
        height: 40.0,
        child: Row(
          children: <Widget>[],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ),
    );
  }
}
