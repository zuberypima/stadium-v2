import 'package:flutter/material.dart';
import 'package:stadiumapp/view/allSeatView.dart';

Widget stadium_layout(context, category) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AllseatView(
                        stadium_side: 'North',
                      )));
            },
            child: Text("North Side")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AllseatView(
                        stadium_side: 'North',
                      )));
            },
            child: Text("Left Side")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AllseatView(
                        stadium_side: 'North',
                      )));
            },
            child: Text("Right Side")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AllseatView(
                        stadium_side: 'North',
                      )));
            },
            child: Text("South Side"))
      ],
    ),
  );
}
