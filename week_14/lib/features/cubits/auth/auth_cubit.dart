import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  String _getFirebaseErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists with this email address.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  Future<void> login(String email, String password) async {
    if (email.trim().isEmpty || password.isEmpty) {
      emit(const AuthFailure('Please enter both email and password.'));
      return;
    }

    emit(const AuthLoading());
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      emit(AuthSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseErrorMessage(e.code)));
    } catch (e) {
      emit(AuthFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> signup(String email, String password) async {
    if (email.trim().isEmpty || password.isEmpty) {
      emit(const AuthFailure('Please enter both email and password.'));
      return;
    }

    emit(const AuthLoading());
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );
      emit(AuthSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_getFirebaseErrorMessage(e.code)));
    } catch (e) {
      emit(AuthFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(const AuthInitial());
    } catch (e) {
      emit(AuthFailure('Failed to logout: ${e.toString()}'));
    }
  }
}
