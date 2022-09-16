import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TestUphomesFirebaseUser {
  TestUphomesFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TestUphomesFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TestUphomesFirebaseUser> testUphomesFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TestUphomesFirebaseUser>(
        (user) => currentUser = TestUphomesFirebaseUser(user));
