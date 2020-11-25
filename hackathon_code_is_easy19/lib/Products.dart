import 'package:MeBusca/root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/kart.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({
    Key key,
  }) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('Produtos'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  child: Text('Qnt Dialog'),
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
                FlatButton(
                  child: Text('MyKart'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return KartPage();
                    }));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
