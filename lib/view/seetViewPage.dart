import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stadiumapp/view/widgets/pitchContainer.dart';
import 'package:stadiumapp/view/widgets/stadium_sides.dart';

class StadiumLayOut extends StatefulWidget {
  const StadiumLayOut({super.key});

  @override
  State<StadiumLayOut> createState() => _StadiumLayOutState();
}

class _StadiumLayOutState extends State<StadiumLayOut> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                  child: Align(
                      alignment: Alignment.center,
                      child: pithContainer(context))),
              Positioned(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: leftPart(context))),
              Positioned(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: rightPart(context))),
              Positioned(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: northPart(context))),
              Positioned(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: southPart(context))),
            ],
          ),
        ),
      ),
    );
  }
}
