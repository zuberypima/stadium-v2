import 'package:flutter/material.dart';
import 'package:stadiumapp/constants/constants.dart';
import 'package:stadiumapp/services/dataservices.dart';
import 'package:stadiumapp/services/smsExtraction.dart';
import 'package:stadiumapp/view/screens/adminPages/createGamePage.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Admin Services"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  nextPageNavigation(context, CreateGames());
                },
                child: Text("Create Games")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  nextPageNavigation(context, SmsExtraction());
                },
                child: Text("Salio Service")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // nextPageNavigation(context, SmsExtraction());
                  DataService().loopFunc();
                },
                child: Text("Add seats"))
          ],
        ),
      ),
    );
  }
}
