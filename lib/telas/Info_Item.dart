import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_time/modelo/Item.dart';

class Info_Item extends StatefulWidget {
  Item _item;

  Info_Item(Item item) {
    this._item = item;
  }

  @override
  _Info_ItemState createState() => _Info_ItemState();
}

class _Info_ItemState extends State<Info_Item> {
  int _cont = 1;
  int _preco = 15;
  int _total = 15;

  int _calculo(int cont, int preco) {
    return cont * preco;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          widget._item.imagem != null
              ? Expanded(
                  flex: 2,
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(widget._item.imagem)))
              : Image.asset('Imagens/pizza.jpg'),
          Flexible(
              child: Text(
            widget._item.nome.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          )),
          Flexible(
              child: Text(
                  'Descricao do pedido serve toda familia muito muito muito muito grande esse texto')),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {0: FractionColumnWidth(.5)},
            children: [
              TableRow(children: [
                Text('Preço:'),
                Align(alignment: Alignment.center, child: Text('R\$ $_preco')),
              ]),
              TableRow(children: [
                Text('Quantidade:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FlatButton(
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              if (_cont > 1) _cont--;
                              _total = _calculo(_cont, _preco);
                            });
                          }),
                    ),
                    Text('$_cont'),
                    Flexible(
                      child: FlatButton(
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              _cont++;
                              _total = _calculo(_cont, _preco);
                            });
                          }),
                    ),
                  ],
                )
              ]),
              TableRow(children: [
                Divider(
                  color: Color.fromRGBO(204, 41, 0, 1),
                  thickness: 2,
                ),
                Divider(
                  color: Color.fromRGBO(204, 41, 0, 1),
                  thickness: 2,
                ),
              ]),
              TableRow(children: [
                Text('Total:'),
                Align(alignment: Alignment.center, child: Text('R\$ $_total'))
              ]),
            ],
          ),
          FlatButton(
              child: Text(
                "Adicionar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Color.fromRGBO(204, 41, 0, 1),
              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
              shape: RoundedRectangleBorder(
                  //side: BorderSide(color: Colors.black,width: 3),
                  borderRadius: BorderRadius.circular(32)),
              onPressed: () {})
        ],
      ),
    );
  }
}
