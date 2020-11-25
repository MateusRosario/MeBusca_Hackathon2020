import 'package:MeBusca/requests/cart.dart';
import 'package:MeBusca/requests/products.dart';
import 'package:MeBusca/requests/markets.dart';
import 'order.dart';

class UserRequests {
  User user = User(
      //Name
      'Mateus',

      //Cart
      Cart([
        Bag(
            Product('000', 'Abacaxi', 'Frutas',
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fconteudo.imguol.com.br%2Fc%2Fentretenimento%2F04%2F2017%2F12%2F11%2Fabacaxi-1513012505452_v2_1920x1280.jpg&imgrefurl=https%3A%2F%2Fwww.uol.com.br%2Fvivabem%2Fnoticias%2Fredacao%2F2018%2F12%2F01%2Fabacaxi-melhora-a-digestao-e-aumenta-a-imunidade-veja-9-beneficios.htm&tbnid=EXyHlxOm14BTzM&vet=12ahUKEwjyn-D2tJ3tAhXoBbkGHdBTA8YQMygBegUIARDmAQ..i&docid=alcDH9DsqcURYM&w=1920&h=1280&q=abacaxi&ved=2ahUKEwjyn-D2tJ3tAhXoBbkGHdBTA8YQMygBegUIARDmAQ'),
            2),
        Bag(
            Product('002', 'Alvejante', 'Limpeza',
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fa-static.mlcdn.com.br%2F1500x1500%2Falvejante-ype-322001-roupas-brancas-2l%2Fmagazineluiza%2F225594700%2Ff51f2a9051ddd293abe155de1e154d44.jpg&imgrefurl=https%3A%2F%2Fwww.magazineluiza.com.br%2Falvejante-ype-322001-roupas-brancas-2l%2Fp%2F225594700%2Fme%2Falve%2F&tbnid=bnt5qU1cbSk2pM&vet=12ahUKEwjryoyKvp3tAhVaG7kGHeQeATkQMygCegUIARDyAQ..i&docid=B4GLIDqmlAkjDM&w=1500&h=1125&q=Alvejante&ved=2ahUKEwjryoyKvp3tAhVaG7kGHeQeATkQMygCegUIARDyAQ'),
            1),
      ]),

      //IsOwner
      true,

      //MyMarket
      markets[0]);

  getUser() {
    return user;
  }
}

class User {
  String name;
  Order order;
  Cart cart;

  bool isOwner;
  Market myMarket;

  User(this.name, this.cart, this.isOwner, this.myMarket);
}
