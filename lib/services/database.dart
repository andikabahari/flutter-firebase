import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/seblak.dart';

class DatabaseService {
  final CollectionReference seblakCollection =
      FirebaseFirestore.instance.collection('seblaks');
  final String? uid;

  DatabaseService({this.uid});

  Future updateUserData(String name, int chilies, int spicyLevel) async {
    return await seblakCollection.doc(uid).set({
      'name': name,
      'chilies': chilies,
      'spicyLevel': spicyLevel,
    });
  }

  List<Seblak> _seblakListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Seblak(
        name: doc.get('name') ?? '',
        chilies: doc.get('chilies') ?? '',
        spicyLevel: doc.get('spicyLevel') ?? 0,
      );
    }).toList();
  }

  Stream<List<Seblak>> get seblaks {
    return seblakCollection.snapshots().map(_seblakListFromSnapshot);
  }
}
