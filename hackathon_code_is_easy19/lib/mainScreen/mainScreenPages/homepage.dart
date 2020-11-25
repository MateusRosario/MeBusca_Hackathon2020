import 'package:MeBusca/root.dart';
import 'package:MeBusca/tool/carouselmarker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/Markets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<StatefulWidget> {
  int carouselPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> markets = [
      MarketTile(),
      MarketTile(),
      MarketTile(),
      MarketTile(),
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 40),
              child: Text(
                'Olá, \nMuitos produtos estão prontinhos para serem escolhidos ;)',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width:
                        (MediaQuery.of(context).size.width / 2).floor() - 20.0,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.shopping_cart,
                            color: AppRoot.getColor(context, 'iconColor'),
                            size: 40),
                        Text(
                          'Mercados',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppRoot.getColor(context, 'first'),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MarketsPage();
                    }));
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: (MediaQuery.of(context).size.width / 2).floor() - 20.0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: AppRoot.getColor(context, 'iconColor'),
                        size: 40,
                      ),
                      Text(
                        'Mais Avaliados',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppRoot.getColor(context, 'fourth'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'Mercados Próximos',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: markets,
                onPageChanged: (int page) {
                  carouselPage = page;
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselMarker(
              totalTiles: markets.length,
              position: carouselPage,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class MarketTile extends StatelessWidget {
  final String name;
  final int distance;

  MarketTile({this.name = 'Placeholder', this.distance = 0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(distance.toString() + ' metros')),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: AppRoot.getColor(context, 'second'),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
