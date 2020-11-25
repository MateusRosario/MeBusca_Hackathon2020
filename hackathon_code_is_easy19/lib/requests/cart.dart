import 'package:MeBusca/requests/products.dart';

class Cart {
  String marketID;
  List<Bag> bags;

  Cart(this.bags);

  List<Bag> get() {
    return bags;
  }

  int getNumRefusedProducts() {
    int num = 0;
    for (int i = 0; i < bags.length; i++) {
      if (!bags[i].checked) {
        num++;
      }
    }
    return num;
  }
}

class Bag {
  Product product;
  int qty;
  bool checked = true;

  Bag(this.product, this.qty);
}
