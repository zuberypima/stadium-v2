import 'package:flutter/material.dart';

Widget profileCardWidget(String _label, IconData IconData) {
  return Card(
    // color: const Color.fromARGB(176, 76, 175, 79),
    color: Colors.blueGrey,
    child: ListTile(
      title: Text(
        _label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        IconData,
        color: Colors.white,
      ),
    ),
  );
}
