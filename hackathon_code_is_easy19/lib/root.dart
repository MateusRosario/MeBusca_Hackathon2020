import 'package:MeBusca/requests/markets.dart';
import 'package:MeBusca/requests/products.dart';
import 'package:MeBusca/requests/user.dart';
import 'package:flutter/material.dart';

class AppRoot extends InheritedWidget {
  AppRoot({Widget child, Key key}) : super(key: key, child: child);

  final userRequests = UserRequests();

  final marketsRequests = MarketsRequests();

  final productsRequests = ProductsRequests();

  final constants = Constants();

  static AppRoot of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  // Return Static color from the contexts constants
  static Color getColor(BuildContext context, String colorCode) =>
      AppRoot.of(context).constants.getColor(colorCode);

  // Return True if User is Owner
  static bool isUserOwner(BuildContext context) =>
      AppRoot.of(context).userRequests.getUser().isOwner;

  @override
  bool updateShouldNotify(AppRoot oldWidget) => oldWidget != this;
}

class Constants {
  Map colors = {
    "production": {
      "first": Color.fromARGB(255, 247, 178, 103),
      "second": Color.fromARGB(255, 247, 157, 101),
      "third": Color.fromARGB(255, 244, 132, 95),
      "fourth": Color.fromARGB(255, 242, 112, 89),
      "fifth": Color.fromARGB(255, 242, 92, 84),
      "iconColor": Color.fromARGB(255, 255, 255, 255)
    }
  };

  // Return Color of the code received
  Color getColor(String colorCode) {
    assert(colors['production'].containsKey(colorCode),
        'colorCode must exist on colors[' + 'production' + '] Map');
    return colors['production'][colorCode];
  }
}
