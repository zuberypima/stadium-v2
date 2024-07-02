import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadiumapp/services/authenticationService.dart';
import 'package:stadiumapp/view/widgets/formfieldOne.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Payment Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Enter Phone Number Used for Payments"),
            ),
            formFielOne("0718934183", _phoneNumber, false),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  Authenticationservice().userPaymentMethod(
                      _auth.currentUser!.email.toString(),
                      _phoneNumber.text,
                      context);
                  Navigator.pop(context);
                },
                child: Text("Add this Number"))
          ],
        ),
      ),
    );
  }
}
