import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_garden/models/user.dart' as u;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user obj based on FirebaseUser (firebaseuser -> user)
  u.User? _userFromFirebaseUser(User? user) {
    return user != null ? u.User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<u.User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

// sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

// sign in email & password
  Future singInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
