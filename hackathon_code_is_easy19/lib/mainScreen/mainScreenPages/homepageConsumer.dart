import 'package:MeBusca/requests/markets.dart';
import 'package:MeBusca/root.dart';
import 'package:MeBusca/tool/carouselmarker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/Markets.dart';

import '../../Products.dart';

class HomePageConsumer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageConsumerState();
}

class HomePageConsumerState extends State<StatefulWidget> {
  int carouselPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Market> markets = AppRoot.of(context).marketsRequests.get();

    Iterable<Widget> marketsList;

    marketsList = markets.map((market) => MarketTile(
          market: market,
        ));

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
                children: marketsList.toList(),
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
  final Market market;

  MarketTile({this.market});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductsPage(
              market: this.market,
            );
          }));
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        this.market.name,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child:
                            Text(this.market.distance.toString() + ' metros')),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(),
                    child: Image.network(
                      this.market.imageURL,
                      fit: BoxFit.fitHeight,
                      loadingBuilder: (BuildContext context, Widget widget,
                          loadingProgress) {
                        Color color = AppRoot.getColor(context, 'iconColor');
                        if (loadingProgress == null) {
                          return widget;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                              valueColor:
                                  new AlwaysStoppedAnimation<Color>(color),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: AppRoot.getColor(context, 'second'),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
