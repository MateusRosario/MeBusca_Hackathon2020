import 'package:flutter/material.dart';
import 'package:hackathon_code_is_easy19/homepage/consumer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ConsumerHomePage(
        title: 'MeBusca',
      ),
    );
  }
}
