import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //srohurhn
      body: Column(
        children: <Widget>[
              Image.asset('Imagens/pizza.jpg')
        ],
      ),
    );
  }
}