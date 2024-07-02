import 'package:flutter/material.dart';

class Stadiumlayouts extends StatefulWidget {
  const Stadiumlayouts({super.key});

  @override
  State<Stadiumlayouts> createState() => _StadiumlayoutsState();
}

class _StadiumlayoutsState extends State<Stadiumlayouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            border: Border.all()
          ),
      height: MediaQuery.of(context).size.width * 2,
    )
    );
  }
}
