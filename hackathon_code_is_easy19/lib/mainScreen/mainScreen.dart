import 'package:MeBusca/root.dart';
import 'package:flutter/material.dart';
import 'package:MeBusca/kart.dart';
import 'package:MeBusca/mainScreen/mainScreenPages/homepage.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController;
  PageView pageView;
  int page = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageView = PageView(
      physics: new NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        HomePage(),
        KartPage(),
        Placeholder(),
        Placeholder(),
      ],
    );

    pageController.addListener(() {
      setState(() {
        page = pageController.page.round();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageView,
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.home,
                    size: 30,
                    color: page != 0
                        ? AppRoot.getColor(context, 'iconColor')
                        : AppRoot.getColor(context, 'first')),
                onPressed: () {
                  pageController.animateToPage(0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.shopping_cart,
                    size: 30,
                    color: page != 1
                        ? AppRoot.getColor(context, 'iconColor')
                        : AppRoot.getColor(context, 'first')),
                onPressed: () {
                  pageController.animateToPage(1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.shop,
                    size: 30,
                    color: page != 2
                        ? AppRoot.getColor(context, 'iconColor')
                        : AppRoot.getColor(context, 'first')),
                onPressed: () {
                  pageController.animateToPage(2,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.account_circle,
                    size: 30,
                    color: page != 3
                        ? AppRoot.getColor(context, 'iconColor')
                        : AppRoot.getColor(context, 'first')),
                onPressed: () {
                  pageController.animateToPage(3,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.decelerate);
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: AppRoot.getColor(context, 'fourth'),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ),
    );
  }
}
