import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/item.dart';

class DatabaseService {
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('items');
  final String? uid;

  DatabaseService({this.uid});

  Future updateUserData(String name, String description, int quantity) async {
    return await itemCollection.doc(uid).set({
      'name': name,
      'description': description,
      'quantity': quantity,
    });
  }

  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Item(
        name: doc.get('name') ?? '',
        description: doc.get('description') ?? '',
        quantity: doc.get('quantity') ?? 0,
      );
    }).toList();
  }

  Stream<List<Item>> get items {
    return itemCollection.snapshots().map(_itemListFromSnapshot);
  }
}
