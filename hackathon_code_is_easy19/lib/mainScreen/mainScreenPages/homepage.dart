import 'package:flutter/material.dart';
import 'package:MeBusca/Markets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
