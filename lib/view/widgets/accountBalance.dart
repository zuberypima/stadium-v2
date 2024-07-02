import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget accountBalanceContainer(context) {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  return FutureBuilder<DocumentSnapshot>(
    future:FirebaseFirestore.instance
        .collection("UsersDetails")
        .doc(_auth.currentUser?.email.toString())
        .get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return balanceContainer(context,'0.00','');
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return balanceContainer(context, data['Ammount'].toString(),data['PhoneNumber'].toString());
      }

      return Center(child: CircularProgressIndicator());
    },
  );
}

Widget balanceContainer(context,String balance,phoneDetails) {
  return Container(
    height: MediaQuery.of(context).size.height / 5,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Current Balance',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          
          ],
        ),
        SizedBox(height: 3),
        Row(
          children: [
            Text(
              balance,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
              SizedBox(width: 5,),
             Text(
          'Tsh /=',
          style: TextStyle(fontSize: 15),
        ),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text(
              'Phone No:',
              style: TextStyle(fontSize: 15),
            ),
              SizedBox(width: 5,),
             Text(
          phoneDetails,
          style: TextStyle(fontSize: 15),
        ),
          ],
        ),
      ],
    ),
  );
}
