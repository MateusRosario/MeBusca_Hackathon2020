import 'package:flutter/material.dart';

import '../../root.dart';

class ProfilePage extends StatefulWidget {
  final Function setOwner;

  const ProfilePage({Key key, this.setOwner}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppRoot.isUserOwner(context)
                ? Text('Owner Account')
                : Text('User Account'),
            SizedBox(
              height: 100,
            ),
            FlatButton(
              color: AppRoot.getColor(context, 'first'),
              child: Text('User View'),
              onPressed: () {
                this.widget.setOwner(false);
              },
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
              color: AppRoot.getColor(context, 'first'),
              child: Text('Owner View'),
              onPressed: () {
                this.widget.setOwner(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
