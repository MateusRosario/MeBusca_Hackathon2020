import 'package:flutter/material.dart';

class KartPage extends StatefulWidget {
  KartPage({
    Key key,
  }) : super(key: key);

  @override
  _KartPageState createState() => _KartPageState();
}

class _KartPageState extends State<KartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('MyKart'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text('Qtd'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Quantidade'),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
