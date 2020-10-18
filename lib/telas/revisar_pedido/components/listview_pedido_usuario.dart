import 'package:flutter/material.dart';
import 'listitem_pedido_usuario.dart';
// TODO - remover as referencias ao carrinho assim que discutirmos como será o backend.
import 'Carrinho.dart';

class ListViewPedidoUsuario extends StatefulWidget {
  @override
  _ListViewPedidoUsuarioState createState() => _ListViewPedidoUsuarioState();
}

class _ListViewPedidoUsuarioState extends State<ListViewPedidoUsuario> {
  Carrinho carrinho;

  @override
  void initState() {
    super.initState();
    // REVIEW - usar Provider
    carrinho = carrinhoTEMP;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: carrinho.itensPedido.length,
      itemBuilder: (context, index) {
        return ListItemPedidoUsuario(item: carrinho.itensPedido[index]);
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

}
