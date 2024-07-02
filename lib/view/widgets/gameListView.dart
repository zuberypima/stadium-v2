import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadiumapp/constants/constants.dart';
import 'package:stadiumapp/view/screens/startBooking.dart';

Widget gameListView(
  String selectedDate,
) {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Games')
          .where("PlayDate", isEqualTo: selectedDate)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return InkWell(
              onTap: () {
                nextPageNavigation(context, StartBooking());
              },
              child: Card(
                color: Colors.green[200],
                child: ListTile(
                  leading: const CircleAvatar(child: Text("TM")),
                  title: Text(
                    data['HomeTeam'],
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(data['AwayTeam'],
                      style: TextStyle(color: Colors.black)),
                  trailing: Icon(
                    Icons.all_out,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      });
}
