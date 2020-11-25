import 'package:MeBusca/mainScreen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/root.dart';

void main() {
  runApp(AppRoot(
    child: MeBuscaApp(),
  ));
}

class MeBuscaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}
