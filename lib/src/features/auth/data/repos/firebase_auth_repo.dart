import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Either<AppError, User>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(AppError.server(
          message: 'Google Sign-In was cancelled',
        ));
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        return right(userCredential.user!);
      } else {
        return left(AppError.server(
          message: 'Google Sign-In failed: No user returned',
        ));
      }
    } on FirebaseAuthException catch (e) {
      return left(AppError.server(
        message: _getFirebaseErrorMessage(e.code),
      ));
    } catch (e) {
      return left(AppError.server(
        message: 'Google Sign-In failed: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<AppError, User>> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return right(userCredential.user!);
      } else {
        return left(AppError.server(
          message: 'Login failed: No user returned',
        ));
      }
    } on FirebaseAuthException catch (e) {
      return left(AppError.server(
        message: _getFirebaseErrorMessage(e.code),
      ));
    } catch (e) {
      return left(AppError.server(
        message: 'An unexpected error occurred: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<AppError, Unit>> logout() async {
    try {
      await _firebaseAuth.signOut();
      return right(unit);
    } catch (e) {
      return left(AppError.server(
        message: 'Logout failed: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<AppError, User>> getAuthenticatedUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return right(user);
      } else {
        return left(AppError.notFound());
      }
    } catch (e) {
      return left(AppError.server(
        message: 'Error getting authenticated user: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<AppError, User>> register(String name, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Update display name
        await userCredential.user!.updateDisplayName(name);

        // Reload user to get updated display name
        await userCredential.user!.reload();

        return right(userCredential.user!);
      } else {
        return left(AppError.server(
          message: 'Registration failed: No user returned',
        ));
      }
    } on FirebaseAuthException catch (e) {
      return left(AppError.server(
        message: _getFirebaseErrorMessage(e.code),
      ));
    } catch (e) {
      return left(AppError.server(
        message: 'An unexpected error occurred: ${e.toString()}',
      ));
    }
  }

  // Helper method to convert Firebase error codes to user-friendly messages
  String _getFirebaseErrorMessage(String code) {
    log('Firebase error code: $code');
    switch (code) {
      case 'invalid-credential':
        return 'Invalid Email or Password. Please try again.';
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account with this email already exists.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Invalid email address. Please check your email format.';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}
