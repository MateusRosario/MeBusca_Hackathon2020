import 'package:MeBusca/orderScreen.dart';
import 'package:MeBusca/requests/markets.dart';
import 'package:MeBusca/requests/order.dart';
import 'package:MeBusca/root.dart';
import 'package:MeBusca/tool/carouselmarker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/Markets.dart';

import '../../Products.dart';

class HomePageOwner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageOwnerState();
}

class HomePageOwnerState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    List<Order> orders =
        AppRoot.of(context).userRequests.getUser().myMarket.orders;
    Iterable<Widget> ordersTiles = orders.map((order) => OrderTile(
          order: order,
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
                'Gerencie Seus Pedidos e Produtos em Estoque',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: ordersTiles.toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final Order order;

  OrderTile({this.order});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OrderScreen(order);
          }));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                  color: AppRoot.getColor(context, 'iconColor'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cliente: ' + this.order.client,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Horário de Busca: ' +
                          this.order.time.hour.toString() +
                          ':' +
                          this.order.time.minute.toString(),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Variedade de Produtos: ' +
                          this.order.cart.bags.length.toString(),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
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
