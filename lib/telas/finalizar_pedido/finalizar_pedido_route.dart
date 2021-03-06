import 'package:flutter/material.dart';
import 'components/form_finalizar_pedido.dart';

/// Posiciona os widgets da tela onde o usuário revisa seu pedido.
///
/// ```dart
/// Navigator.pushNamed(context, [FinalizarPedido.nomeTela]);
/// ```
class FinalizarPedido extends StatelessWidget {
  static const String nomeTela = '/finalizar_pedido';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTela),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              FormFinalizarPedido(),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  child: Text('Pedir'.toUpperCase()),
                  onPressed: () {
                    _enviaPedidoBancoDados(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Envia o pedido para o banco de dados.
  ///
  /// Trata as possíveis excessões e retorna que o pedido foi relizdo com
  /// sucesso ou não.
  void _enviaPedidoBancoDados(BuildContext context) {
    // TODO - conectar e tratar das excessões que possam acontecer;
    Navigator.pop(context, <String, dynamic>{'pedido_realizado': true});
  }
}
