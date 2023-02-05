import 'package:habit/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as developer;

class AuthRepository {
  final Ref _ref;

  const AuthRepository(this._ref);

  GoogleSignIn get _googleSignIn => GoogleSignIn();

  Stream<User?> get authStateChanges =>
      _ref.read(firebaseAuthProvider).authStateChanges();

  // Future<UserCredential> signUp(String email, String password) async {
  //   try {
  //     final result = await _ref.read(firebaseAuthProvider)._googleSignIn(
  //           email: email,
  //           password: password,
  //         );
  //     return result;
  //   } on FirebaseAuthException catch (e) {
  //     throw convertAuthError(e.code);
  //   }
  // }

  /// Google accountでサインイン
  Future<void> signUp() async {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // pi(googleSignInAuthentication);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        await _ref.read(firebaseAuthProvider).signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        throw convertAuthError(e.code);
      } catch (e) {
        throw convertAuthError(e.toString());
      }
    }
  }

  User? getCurrentUser() {
    try {
      return _ref.read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e.code);
    }
  }

  Future<void> signOut() async {
    try {
      await _ref.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw convertAuthError(e.code);
    }
  }

  convertAuthError(String code) {
    developer.log('AuthRepository: $code');
  }
}
