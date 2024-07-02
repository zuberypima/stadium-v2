import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadiumapp/services/authenticationService.dart';
import 'package:stadiumapp/view/widgets/accountBalance.dart';
import 'package:stadiumapp/view/widgets/accountDetails.dart';
import 'package:stadiumapp/view/widgets/paymentDetails.dart';

class PaymentMethodLis extends StatefulWidget {
  const PaymentMethodLis({super.key});

  @override
  State<PaymentMethodLis> createState() => _PaymentMethodLisState();
}

class _PaymentMethodLisState extends State<PaymentMethodLis> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser?.phoneNumber.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill & Payments"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: TextButton(
                onPressed: () {
                  Authenticationservice().logoutService(context);
                },
                child: Text("LogOut")),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: accountDetailsContainer(context),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: accountBalanceContainer(context),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: paymentDetails(context),
          )
        ],
      ),
    );
  }
}
