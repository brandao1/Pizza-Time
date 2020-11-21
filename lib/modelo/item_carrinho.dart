import 'Item.dart';

// NOTE - essa classe não vai para o firestore
class ItemCarrinho {
  Item item;
  int quantidade;

  ItemCarrinho({this.item, this.quantidade});

  double get total => quantidade * double.parse(item.preco);
}
