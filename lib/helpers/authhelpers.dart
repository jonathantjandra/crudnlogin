import 'package:firebase_auth/firebase_auth.dart';
import '../data_models/logins.dart';
import '../data_models/users.dart';

class AuthHelpers {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users? _firebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users?> get user {
    return _auth.authStateChanges().map(_firebaseUser);
  }

  Future signInGuest() async {
    try {
      UserCredential userCred = await _auth.signInAnonymously();
      User? user = userCred.user;
      return _firebaseUser(user);
    } catch (error) {
      return Users(err: error.toString(), uid: null);
    }
  }

  Future signInMail(Logins _login) async {
    try {
      UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _login.mail.toString(), password: _login.pswd.toString());
      User? user = userCred.user;
      return _firebaseUser(user);
    } on FirebaseAuthException catch (error) {
      return Users(err: error.code, uid: null);
    }
  }

  Future signUpMail(Logins _login) async {
    try {
      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _login.mail.toString(), password: _login.pswd.toString());
      User? user = userCred.user;
      return _firebaseUser(user);
    } on FirebaseAuthException catch (error) {
      return Users(err: error.code, uid: null);
    } catch (error) {
      return Users(err: error.toString(), uid: null);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      return null;
    }
  }
}
