import 'package:flutter/material.dart';

Widget seetLayout(int _crossAxisCount, int _itemCount) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount),
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.amber,
          child: Icon(
            Icons.chair,
          ),
        );
      });
}
