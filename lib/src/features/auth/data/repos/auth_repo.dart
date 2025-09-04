import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';

abstract class AuthRepo {
  Future<Either<AppError, User>> login(String email, String password);
  Future<Either<AppError, User>> signInWithGoogle();
  Future<Either<AppError, Unit>> logout();
  Future<Either<AppError, User>> getAuthenticatedUser();
  Future<Either<AppError, User>> register(String name, String email, String password);
}
