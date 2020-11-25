import 'package:flutter/material.dart';
import 'package:hackathon_code_is_easy19/Products.dart';

class MarketsPage extends StatefulWidget {
  MarketsPage({
    Key key,
  }) : super(key: key);

  @override
  _MarketsPageState createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('Mercados'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text('Produtos'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductsPage();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
