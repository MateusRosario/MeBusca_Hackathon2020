import 'package:MeBusca/requests/cart.dart';
import 'package:flutter/material.dart';

class Order {
  String client;
  Cart cart;
  TimeOfDay time;

  Order(this.client, this.time, this.cart);
}
