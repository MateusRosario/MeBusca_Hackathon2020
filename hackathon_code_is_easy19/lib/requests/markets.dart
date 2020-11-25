import 'package:MeBusca/requests/cart.dart';
import 'package:MeBusca/requests/products.dart';
import 'package:flutter/material.dart';

import 'order.dart';

//Lista de Mercados no Sistema
List<Market> markets = [
  Market(
    '000',
    'Mercado Baratão', 10,
    'https://portalpalhoca.com.br/uploads/classified/supermercado-baratao.jpeg',

    //Store
    [],

    //Orders
    [
      Order(
        'Valentina',
        TimeOfDay(hour: 14, minute: 30),
        Cart([
          Bag(products[0], 2),
          Bag(products[1], 1),
          Bag(products[4], 2),
        ]),
      ),
      Order(
        'Adalberto',
        TimeOfDay(hour: 16, minute: 00),
        Cart([
          Bag(products[0], 2),
          Bag(products[1], 1),
          Bag(products[4], 2),
        ]),
      ),
    ],
  ),
  Market(
    '001',
    'Mateus', 1200,
    'https://s2.glbimg.com/PuYLyGRTeaqCPRpuX2PFUR8q3MQ=/0x0:530x281/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_63b422c2caee4269b8b34177e8876b93/internal_photos/bs/2020/n/j/xLKRx1S8ukaxTWFDJL1A/grupomateus.jpg',

    //Store
    [],

    //Orders
    null,
  ),
  Market(
    '002',
    'Fruteira Peg Pag', 8000,
    'https://i.pinimg.com/originals/df/39/ba/df39baf9cb6bce88325f39e831ad8a3d.jpg',

    //Store
    [],

    //Orders
    null,
  ),
];

class MarketsRequests {
  List<Market> get() {
    return markets;
  }
}

class Market {
  String id;
  String name;
  int distance;
  String imageURL;
  List<Product> store = [];
  List<Order> orders = [];

  Market(this.id, this.name, this.distance, this.imageURL, this.store,
      this.orders);
}
