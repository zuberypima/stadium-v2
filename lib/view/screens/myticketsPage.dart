import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadiumapp/constants/constants.dart';
import 'package:stadiumapp/view/screens/ticketView.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({super.key});

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _MyTicketsPageState extends State<MyTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          // backgroundColor: Colors.lightBlueAccent[100],
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("My Tickets"),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('UsersDetails')
                .doc(_auth.currentUser?.email.toString())
                .collection("MyTickets")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Ticket"),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Ticket"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Card(
                      color: Colors.lightBlue[100],
                      child: ListTile(
                        title: Text(
                          "Seat No:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(data['SeatNum'].toString()),
                        trailing: InkWell(
                          onTap: () {
                            nextPageNavigation(
                                context,
                                Ticketview(
                                    seatNumber: data['SeatNum'].toString(),
                                    ticketOuwner: data["TicketNum"]));
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          )),
    );
  }
}
