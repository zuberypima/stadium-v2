import 'package:flutter/material.dart';
import 'package:stadiumapp/services/dataservices.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                DataService().loopFunc();
              },
              child: Text(" Add Games")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                DataService().createSeats(100);
              },
              child: Text(" Add Database"))
        ],
      ),
    );
  }
}
