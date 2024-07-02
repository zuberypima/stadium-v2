import 'package:flutter/material.dart';

Widget leftPart(context){
  return Container(
    width: MediaQuery.of(context).size.width/4,
    height: MediaQuery.of(context).size.height/5,
    color: Colors.brown,
    child: Center(child: Text("Left Part")),
  );

}


Widget rightPart(context){
  return Container(
    width: MediaQuery.of(context).size.width/4,
    height: MediaQuery.of(context).size.height/3,
    color: Colors.cyan,
    child: Center(child: Text("Left Part")),
  );

}

Widget northPart(context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height/3,
    color: Colors.amber,
    child: Center(child: Text("Left Part")),
  );

}

 bool shouldReclip(CustomClipper<Path> oldClipper) { 
    return false; 
  } 


Path getClip(Size size) { 
    // Define a custom path to create a stylish clipped shape 
    var path = Path(); 
    path.moveTo(0, size.height * 0.5); 
    path.lineTo(size.width * 0.2, 0); 
    path.lineTo(size.width * 0.8, 0); 
    path.lineTo(size.width, size.height * 0.5); 
    path.lineTo(size.width * 0.8, size.height); 
    path.lineTo(size.width * 0.2, size.height); 
    path.close(); 
    return path; 
  } 

Widget southPart(context){

  return ClipPath(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/3,
      color: Colors.blue,
      child: Center(child: Text("Soutth Part")),
    ),
  );

}