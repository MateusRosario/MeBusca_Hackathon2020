import 'package:MeBusca/requests/products.dart';

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
    [],
  ),
  Market(
    '001',
    'Mercearia Portela', 1200,
    'https://www.cidadesaqui.com.br/media/com_jbusinessdirectory/pictures/companies/74/20180918124402-1538725595.jpg',

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
