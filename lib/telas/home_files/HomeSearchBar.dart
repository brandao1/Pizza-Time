import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_time/telas/Info_Item.dart';
import 'dart:io';
class HomeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(204, 41, 0, 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          hintStyle: TextStyle(color: Color.fromRGBO(89, 89, 89, 1),fontWeight: FontWeight.w600),
          hintText: "Procure",
          contentPadding: EdgeInsets.zero
      ),
    );
  }
}
