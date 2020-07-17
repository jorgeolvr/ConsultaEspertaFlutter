import 'package:firebase_auth/firebase_auth.dart';
import '../../Models/User/index.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Retorna o nome do usuário logado no sistema
  Future<String> getUsername() async {
    FirebaseUser currentUser = await _auth.currentUser();
    if (currentUser != null) {
      return currentUser.displayName;
    } else {
      return '';
    }
  }

  // Fazer sign-up com e-mail e senha
  Future signUpWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;
      FirebaseUser currentUser = await _auth.currentUser();
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();

      userUpdateInfo.displayName = name;
      currentUser.updateProfile(userUpdateInfo);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Fazer sign-in com e-mail e senha
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Fazer sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
