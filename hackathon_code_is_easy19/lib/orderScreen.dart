import 'package:MeBusca/requests/cart.dart';
import 'package:MeBusca/requests/order.dart';
import 'package:MeBusca/root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final Order order;

  OrderScreen(this.order);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    List<Bag> bags = this.widget.order.cart.bags;
    Iterable<Widget> ordersTiles = bags.map((bag) => BagTile(
          bag: bag,
          setStateFather: () {
            setState(() {});
          },
        ));

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 40),
            child: Text(
              'Detalhes do Pedido',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text('Cliente: ' + this.widget.order.client)),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Horário de Busca: ' +
                  this.widget.order.time.hour.toString() +
                  ':' +
                  this.widget.order.time.minute.toString(),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: ordersTiles.toList(),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              this.widget.order.cart.getNumRefusedProducts().toString() +
                  ' produtos pedidos recusados',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                FlatButton(
                  color: Colors.black26,
                  child: Text('Voltar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                FlatButton(
                  color: Color.fromARGB(255, 87, 204, 153),
                  child: Text('Confirmar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Placeholder();
                        },
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BagTile extends StatefulWidget {
  final Bag bag;
  final Function setStateFather;

  BagTile({this.bag, this.setStateFather});

  @override
  State<BagTile> createState() => BagTileState();
}

class BagTileState extends State<BagTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              ClipRRect(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    this.widget.bag.product.imageURL,
                    fit: BoxFit.fitHeight,
                    loadingBuilder:
                        (BuildContext context, Widget widget, loadingProgress) {
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.widget.bag.product.item,
                    ),
                    Text(
                      'Categoria: ' + this.widget.bag.product.category,
                    ),
                    Text(
                      'Quantidade: ' + this.widget.bag.qty.toString(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(this.widget.bag.checked
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked),
                  onTap: () {
                    setState(() {
                      this.widget.bag.checked = !this.widget.bag.checked;
                    });
                    this.widget.setStateFather();
                  },
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
