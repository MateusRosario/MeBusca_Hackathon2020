import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../root.dart';

class CarouselMarker extends StatelessWidget {
  final int totalTiles;
  final int position;
  final double sizeHighlighted = 7.0;
  final double size = 5.0;
  final int maxMarkers = 7;

  const CarouselMarker({Key key, this.totalTiles, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> markers = [];
    if (totalTiles <= maxMarkers) {
      for (var i = 0; i < totalTiles; i++) {
        markers.add(bolMarker(context, i == position));
      }
    } else {
      int numMarkersBeforeWideMarker = ((maxMarkers - 1) / 2).round(); //2
      int numMarkersAfterWideMarker = ((maxMarkers - 1) / 2).floor();
      bool isPositionOnWideMarker = position >= numMarkersBeforeWideMarker &&
          position < totalTiles - numMarkersAfterWideMarker;

      for (var i = 0; i < maxMarkers; i++) {
        if (i == (maxMarkers / 2).floor()) {
          markers.add(wideMarker(context, isPositionOnWideMarker));
        } else {
          markers.add(bolMarker(
              context,
              !isPositionOnWideMarker &&
                  ((position == i && position < numMarkersBeforeWideMarker) ||
                      (position > numMarkersBeforeWideMarker &&
                          ((totalTiles - position) == (maxMarkers - i))))));
        }
      }
    }

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: markers,
      ),
    );
  }

  Widget bolMarker(BuildContext context, bool highlighted) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      width: highlighted ? sizeHighlighted : size,
      height: highlighted ? sizeHighlighted : size,
      decoration: BoxDecoration(
          color: highlighted
              ? AppRoot.getColor(context, 'second')
              : AppRoot.getColor(context, 'first'),
          borderRadius: BorderRadius.circular(
              (highlighted ? sizeHighlighted : size) / 2)),
    );
  }

  Widget wideMarker(BuildContext context, bool highlighted) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      width: highlighted ? sizeHighlighted * 2 : size * 2,
      height: highlighted ? sizeHighlighted : size,
      decoration: BoxDecoration(
          color: highlighted
              ? AppRoot.getColor(context, 'second')
              : AppRoot.getColor(context, 'first'),
          borderRadius: BorderRadius.circular(
              (highlighted ? sizeHighlighted : size) / 2)),
    );
  }
}
