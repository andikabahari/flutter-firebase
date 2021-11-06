import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('items');
}
