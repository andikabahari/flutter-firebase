import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/my_user.dart';
import 'package:flutter_firebase/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _userFromFirebase(User? user) {
    if (user != null) {
      return MyUser(uid: user.uid);
    }

    return null;
  }

  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future signInAnonymously() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData('new member', 1, 100);

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
