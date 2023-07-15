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
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    'https://user-images.githubusercontent.com/38531751/100265363-e7451f00-2f2e-11eb-8253-523661a09ae7.png',
                    fit: BoxFit.fitWidth,
                    loadingBuilder:
                        (BuildContext context, Widget widget, loadingProgress) {
                      Color color = AppRoot.getColor(context, 'iconColor');
                      if (loadingProgress == null) {
                        return widget;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(color),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppRoot.isUserOwner(context)
                ? Text('Owner Account')
                : Text('User Account'),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                FlatButton(
                  color: AppRoot.getColor(context, 'first'),
                  child: Text('User View'),
                  onPressed: () {
                    this.widget.setOwner(false);
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                  color: AppRoot.getColor(context, 'first'),
                  child: Text('Owner View'),
                  onPressed: () {
                    this.widget.setOwner(true);
                  },
                ),
                Expanded(child: Container()),
              ],
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
