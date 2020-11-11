import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_time/telas/revisar_pedido/revisar_pedido_usuario.dart';
import './Alteracao.dart';
import 'package:pizza_time/telas/Info_Item.dart';
import 'dart:io';
import '../Login.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Perfil',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.perm_identity,
              color: Theme.of(context).accentIconTheme.color,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(Alteracao.nomeTela);
            },
          ),
          ListTile(
            title: Text(
              'Pedidos Feitos',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.list_alt_rounded,
              color: Theme.of(context).accentIconTheme.color,
            ),
          ),
          ListTile(
            title: Text(
              'Carrinho',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentIconTheme.color,
            ),
            subtitle: Text(
              'Pedidos',
              style: TextStyle(color: Colors.black),
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).pushNamed(RevisarPedidoUsuario.nomeTela);
            },
          ),
          ListTile(
            title: Text(
              'Chat',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Icons.chat,
              color: Theme.of(context).accentIconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}
