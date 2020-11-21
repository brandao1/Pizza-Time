// ignore: slash_for_doc_comments
/**
EXEMPLO DE USO

```dart
import '.../pedido_firebase.dart' as pedidoFirebaseCrud;
...
var pedido = Pedido(statusPedido: 'Na fila', pagamento: 'Dinheiro');
// CREATE
pedidoFirebaseCrud.create(pedido);
print(pedido.toMap());

// READ
var documento = Firestore.instance.document(
  '${pedidoFirebaseCrud.pathPedidosRestaurante}/${pedido.idPedido}'
);
var lidoCriado = await pedidoFirebaseCrud.read(documento);
print(lidoCriado.toMap());

// UPDATE
pedidoFirebaseCrud.update(
  pedido
    ..statusPedido = 'Preparando'
    ..idsItemQuantidade = {'aa': 2, 'bb': 3}
    ..idEndereco = 'algumUuid'
);

// READ
var lidoAtualizado = await pedidoFirebaseCrud.read(documento);
print(lidoAtualizado.toMap());

// DELETE
pedidoFirebaseCrud.delete(pedido);

// READ
var lidoDeletado = await pedidoFirebaseCrud.read(documento);
print('${lidoDeletado?.toMap()==null ? 'Não existe um pedido no documento fornecido.': lidoDeletado.toMap()}');
```
*/

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pizza_time/modelo/pedido.dart';

const pathPedidosRestaurante = '/restaurante/unico/pedidos';

// TODO - unir com o crud do usuario, para atualizar a lista de pedidos dele.

/// Armazena no banco de dados um novo documento com o [pedido] fornecido.
///
/// O [pedido] fornecido será armazenado na coleção de pedidos do restaurante.
///
/// ```dart
/// ...
/// await create(novoPedido);
/// ...
/// ```
void create(Pedido pedido) async {
  DocumentReference novoDocumentoRestaurante =
      Firestore.instance.collection(pathPedidosRestaurante).document();
  pedido.idPedido = novoDocumentoRestaurante.documentID;
  await novoDocumentoRestaurante.setData(pedido.toMap(), merge: false);
}

/// Lê o [documento] e retorna um pedido com os dados lidos.
///
/// Retorna null se o documento não existir.
///
/// ```dart
/// ...
/// Pedido aux = await read(refPedidoUsuario);
/// ...
/// ```
Future<Pedido> read(DocumentReference documento) async {
  final snapshot = await documento?.get();
  return snapshot.data == null ? null : Pedido.fromMap(snapshot.data);
}

/// Atualiza o [pedido] no firestore, com o valor atual do [pedido].
///
/// ```dart
/// ...
/// await update(pedido);
/// ...
/// ```
void update(Pedido pedido) async {
  DocumentReference documento = Firestore.instance
      .collection(pathPedidosRestaurante)
      .document(pedido.idPedido);
  await documento.updateData(pedido.toMap());
}

/// Remove do firestore o [pedido] armazenado na coleção de pedidos do restaurante.
///
/// ```dart
/// ...
/// await delete(pedido);
/// ...
/// ```
void delete(Pedido pedido) async {
  DocumentReference documento = Firestore.instance
      .collection(pathPedidosRestaurante)
      .document(pedido.idPedido);
  await documento.delete();
}