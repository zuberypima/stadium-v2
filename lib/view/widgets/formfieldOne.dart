import 'package:flutter/material.dart';

Widget formFielOne(String hintText,TextEditingController _controller,  obSecure){
  return Container(
    child: TextFormField(
      controller: _controller,
       obscureText:obSecure,
      decoration: InputDecoration(
        hintText:hintText ,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder()
      ),
    ));
}