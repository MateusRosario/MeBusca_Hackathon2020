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
    [
      Product('005', 'Abacate', category[0],
          'https://static.tuasaude.com/media/article/gl/lo/beneficios-do-abacate_13382_l.webp'),
      Product('000', 'Abacaxi', category[0],
          'https://conteudo.imguol.com.br/c/entretenimento/04/2017/12/11/abacaxi-1513012505452_v2_900x506.jpgx'),
      Product('003', 'Alface 300g', category[1],
          'https://www.grupocultivar.com.br/ativemanager/uploads/galeria/0bc7d-alface1.jpg'),
      Product('002', 'Alvejante', category[4],
          'https://a-static.mlcdn.com.br/618x463/alvejante-ype-322001-roupas-brancas-2l/magazineluiza/225594700/f51f2a9051ddd293abe155de1e154d44.jpg'),
      Product('004', 'Coca-cola 2L', category[3],
          'https://marketup-cdn.s3-us-west-2.amazonaws.com/files/331946/products/5a32cf7f-8ec5-4dad-ae88-6b516d41ee39.jpeg'),
      Product('007', 'Arroz', category[6],
          'https://assets.instabuy.com.br/ib.item.image.big/b-916a4c834b6a4fd9bf0b4411090af857.jpeg'),
      Product('008', 'Leite', category[3],
          'https://carrefourbr.vtexassets.com/arquivos/ids/211134-800-auto?width=800&height=auto&aspect=true'),
    ],

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
    'Mercearia Portela', 1200,
    'https://www.cidadesaqui.com.br/media/com_jbusinessdirectory/pictures/companies/74/20180918124402-1538725595.jpg',

    //Store
    [
      Product('003', 'Alface 300g', category[1],
          'https://www.grupocultivar.com.br/ativemanager/uploads/galeria/0bc7d-alface1.jpg'),
      Product('002', 'Alvejante', category[4],
          'https://a-static.mlcdn.com.br/618x463/alvejante-ype-322001-roupas-brancas-2l/magazineluiza/225594700/f51f2a9051ddd293abe155de1e154d44.jpg'),
      Product('004', 'Coca-cola 2L', category[3],
          'https://marketup-cdn.s3-us-west-2.amazonaws.com/files/331946/products/5a32cf7f-8ec5-4dad-ae88-6b516d41ee39.jpeg'),
      Product('007', 'Arroz', category[6],
          'https://assets.instabuy.com.br/ib.item.image.big/b-916a4c834b6a4fd9bf0b4411090af857.jpeg'),
      Product('008', 'Leite', category[3],
          'https://carrefourbr.vtexassets.com/arquivos/ids/211134-800-auto?width=800&height=auto&aspect=true'),
      Product('009', 'Desosorante', category[5],
          'https://carrefourbr.vtexassets.com/arquivos/ids/198156-800-auto?width=800&height=auto&aspect=true'),
      Product('010', 'Toddy', category[6],
          'https://carrefourbr.vtexassets.com/arquivos/ids/195995-800-auto?width=800&height=auto&aspect=true'),
    ],

    //Orders
    null,
  ),
  Market(
    '002',
    'Fruteira Peg Pag', 8000,
    'https://i.pinimg.com/originals/df/39/ba/df39baf9cb6bce88325f39e831ad8a3d.jpg',

    //Store
    [
      Product('003', 'Alface 300g', category[1],
          'https://www.grupocultivar.com.br/ativemanager/uploads/galeria/0bc7d-alface1.jpg'),
      Product('002', 'Alvejante', category[4],
          'https://a-static.mlcdn.com.br/618x463/alvejante-ype-322001-roupas-brancas-2l/magazineluiza/225594700/f51f2a9051ddd293abe155de1e154d44.jpg'),
      Product('004', 'Coca-cola 2L', category[3],
          'https://marketup-cdn.s3-us-west-2.amazonaws.com/files/331946/products/5a32cf7f-8ec5-4dad-ae88-6b516d41ee39.jpeg'),
      Product('001', 'Colgate', category[5],
          'https://img.onofre.com.br/catalog/product/c/o/colgate_50g_2_.jpg?width=450&height=450&quality=85&type=resize'),
      Product('008', 'Leite', category[3],
          'https://carrefourbr.vtexassets.com/arquivos/ids/211134-800-auto?width=800&height=auto&aspect=true'),
      Product('011', 'Feijão', category[6],
          'https://carrefourbr.vtexassets.com/arquivos/ids/194917-800-auto?width=800&height=auto&aspect=true'),
    ],

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
