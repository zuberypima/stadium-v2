import 'package:flutter/material.dart';
import 'package:stadiumapp/view/widgets/addPaymentMethod.dart';

Widget paymentDetails(context) {
  return Container(
    // color: Colors.amber,
    height: MediaQuery.of(context).size.height / 7,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tigopesa',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        SizedBox(height: 3),
        Text(
          '+255 718 934 183',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        SizedBox(height: 5),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.lightBlueAccent[100]),
                    foregroundColor: WidgetStatePropertyAll(Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPaymentMethod()));
                },
                child: Text('Add Payment Method')))
      ],
    ),
  );
}
