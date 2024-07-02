import 'package:flutter/material.dart';

Widget pithContainer(context) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
        borderRadius: BorderRadius.circular(50)),
    child: Center(
        child: Text(
      "Pithc Ground",
      style: TextStyle(color: Colors.white),
    )),
  );
}
