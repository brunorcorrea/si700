import 'package:aula_09/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthenticationService {
  static FireBaseAuthenticationService helper =
      FireBaseAuthenticationService._createInstance();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FireBaseAuthenticationService._createInstance();

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(user.uid) : null;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    return _userFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  //Stream
  Stream get stream {
    return _firebaseAuth
        .userChanges()
        .map((event) => _userFromFirebaseUser(event));
  }
}
