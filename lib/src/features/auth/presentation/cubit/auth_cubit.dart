import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/models/user_model.dart';
import 'package:phrasly_ai_tools/src/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';
part 'gen/auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthState.initial());

  bool get isLoggedIn => state is AuthStateAuthenticated;
  UserModel? get user => state is AuthStateAuthenticated ? (state as AuthStateAuthenticated).user : null;

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    final result = await _authRepo.getAuthenticatedUser();
    log('Auth status check result: $result');

    await result.match(
      (error) {
        log('Error checking auth status: ${error.message}');
        emit(AuthState.unauthenticated());
      },
      (firebaseUser) async {
        final userModel = UserModel.fromFirebaseUser(firebaseUser);
        await setUser(userModel);
      },
    );
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _authRepo.login(email, password);
    result.match(
      (error) {
        log('Error logging in: ${error.message}');
        emit(AuthState.error(error));
      },
      (firebaseUser) async {
        final userModel = UserModel.fromFirebaseUser(firebaseUser);
        await setUser(userModel);
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.loading());
    final result = await _authRepo.signInWithGoogle();
    result.match(
      (error) {
        log('Error signing in with Google: ${error.message}');
        emit(AuthState.error(error));
      },
      (firebaseUser) async {
        final userModel = UserModel.fromFirebaseUser(firebaseUser);
        await setUser(userModel);
      },
    );
  }

  Future<void> register(String name, String email, String password) async {
    emit(const AuthState.loading());
    final result = await _authRepo.register(name, email, password);
    result.match(
      (error) {
        log('Error registering: ${error.message}');
        emit(AuthState.error(error));
      },
      (firebaseUser) async {
        log('User registered successfully: $firebaseUser');
        final userModel = UserModel.fromFirebaseUser(firebaseUser);
        await setUser(userModel);
      },
    );
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    final result = await _authRepo.logout();
    result.match(
      (error) => emit(AuthState.error(error)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future setUser(UserModel user) async {
    emit(AuthState.authenticated(user));
  }
}
