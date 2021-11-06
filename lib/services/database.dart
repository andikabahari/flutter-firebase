import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('items');
  final String uid;

  DatabaseService({required this.uid});

  Future updateUserData(String name, String description, int quantity) async {
    return await itemCollection.doc(uid).set({
      'name': name,
      'description': description,
      'quantity': quantity,
    });
  }
}
