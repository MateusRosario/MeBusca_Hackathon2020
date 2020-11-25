import 'package:MeBusca/requests/products.dart';

class Cart {
  String marketID;
  List<Bag> bags;

  Cart(this.bags);

  List<Bag> get() {
    return bags;
  }
}

class Bag {
  Product product;
  int qty;

  Bag(this.product, this.qty);
}
