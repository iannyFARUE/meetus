
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolbookapp/app_chat_groups/models/user.dart';
import 'package:schoolbookapp/configs/storage_services.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(id: user.uid, email: user.email) : null;
  }

  Future singleSignIn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();

      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map((user) => _userFromFirebase(user));
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
    }
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      print("In login");
      /*AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);*/
      String token = "";
      AuthResult result = await _auth.signInWithCustomToken(token: token);

      FirebaseUser user = result.user;
      await StorageService.putStringAsync(StorageService.USERNAME, user.uid);
      //final test = await user.getIdToken(refresh: false);
      print('----------------------' + user.uid);
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
