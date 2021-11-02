import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/my_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _firebaseUser(User? user) {
    if (user != null) {
      return MyUser(uid: user.uid);
    }

    return null;
  }

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _firebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
