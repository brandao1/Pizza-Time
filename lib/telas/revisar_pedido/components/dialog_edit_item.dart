import 'package:flutter/material.dart';
// TODO - remover as referencias ao carrinho assim que discutirmos como será o backend.
import 'Carrinho.dart';

/// Edita um item dentro do pedido.
///
/// Modifica a quantidade, ou remove da lista de pedido.
class DialogEditarItem extends StatefulWidget {
  final ItemPedido item;
  final Carrinho carrinho;

  /// Contrói o editor para [item] dentro do [carrinho].
  DialogEditarItem({@required this.carrinho, @required this.item});

  @override
  _DialogEditarItemState createState() => _DialogEditarItemState();
}

class _DialogEditarItemState extends State<DialogEditarItem> {
  // referencia para widget.param.item
  ItemPedido item;
  // referencia para widget.param.carrinho
  Carrinho carrinho;

  @override
  void initState() {
    super.initState();
    item = widget.item;
    carrinho = widget.carrinho;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${item.nome}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
              Spacer(),
              IconButton(
                constraints: BoxConstraints.tightFor(),
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.teal[200],
          ),
        ),
        // Image.network(src, fit: BoxFit.fitWidth,)
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            'Valor unitário: ${Carrinho.moeda} ${item.valor.toStringAsFixed(2)}',
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
        _buildEditorQuantidade(context, item),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            'Subtotal: ${Carrinho.moeda} ${item.subtotal.toStringAsFixed(2)}',
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'ok'.toUpperCase(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              onPressed: () {},
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'cancelar'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.black),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(32),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  // Contrói a barra de edição da quantidade do item.
  Widget _buildEditorQuantidade(BuildContext context, ItemPedido item) {
    return Table(
      columnWidths: {1: FlexColumnWidth(0.4)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
                shape: CircleBorder(),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    item.quantidade--;
                  });
                },
              ),
            ),
            Text(
              '${item.quantidade}',
              textAlign: TextAlign.center,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: CircleBorder(),
                color: Colors.green,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    item.quantidade++;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
