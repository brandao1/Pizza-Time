import 'Item.dart';

// NOTE - essa classe não vai para o firestore
class ItemCarrinho {
  Item item;
  int quantidade;

  double get total => quantidade * item.preco;
}
