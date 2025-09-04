# Firebase Authentication Implementation

This directory contains a simplified Firebase authentication implementation for the Flutter app, focusing on email/password authentication only.

## Overview

The authentication system is built using:
- **Firebase Auth**: For backend authentication services
- **BLoC/Cubit**: For state management
- **Freezed**: For immutable data classes

## Architecture

```
auth/
├── data/
│   ├── models/
│   │   └── user_model.dart          # User data model
│   └── repos/
│       ├── auth_repo.dart           # Abstract interface
│       └── firebase_auth_repo.dart  # Firebase implementation
└── presentation/
    └── cubit/
        ├── auth_cubit.dart          # Authentication logic
        └── auth_state.dart          # State definitions
```

## Features

### Core Authentication
- ✅ User registration with email/password
- ✅ User login with email/password
- ✅ User logout
- ✅ Check authentication status
- ✅ Get current authenticated user

## Usage

### 1. Initialize Firebase

Make sure Firebase is properly initialized in your app:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

### 2. Set up Dependency Injection

```dart
// In your locator setup
locator.registerLazySingleton<AuthRepo>(() => FirebaseAuthRepo());
locator.registerFactory(() => AuthCubit(locator<AuthRepo>()));
```

### 3. Use in UI

```dart
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.when(
            initial: () => LoginForm(),
            loading: () => CircularProgressIndicator(),
            authenticated: (user) => HomePage(user: user),
            unauthenticated: () => LoginForm(),
            error: (error) => ErrorWidget(error: error),
          );
        },
      ),
    );
  }
}
```

### 4. Authentication Actions

```dart
// Login
context.read<AuthCubit>().login('user@example.com', 'password');

// Register
context.read<AuthCubit>().register('John Doe', 'user@example.com', 'password');

// Logout
context.read<AuthCubit>().logout();

// Check auth status
context.read<AuthCubit>().checkAuthStatus();
```

## Error Handling

The system provides comprehensive error handling with user-friendly messages:

- **Network errors**: Connection timeouts, network failures
- **Authentication errors**: Invalid credentials, user not found
- **Validation errors**: Weak passwords, invalid emails
- **Server errors**: Firebase service issues

## State Management

The authentication state includes:

- `initial`: Initial state
- `loading`: Authentication in progress
- `authenticated`: User is logged in
- `unauthenticated`: User is not logged in
- `error`: Authentication error occurred

## Security Features

- Secure password handling
- Firebase's built-in security
- Proper session management
- Error handling without exposing sensitive information

## Dependencies

- `firebase_auth: ^5.5.1`
- `flutter_bloc: ^9.1.0`
- `freezed: ^2.5.7`

## Next Steps

1. **Email Verification**: Implement email verification flow
2. **Social Auth**: Add Google, Facebook, Apple Sign-In
3. **Biometric Auth**: Implement fingerprint/face recognition
4. **Multi-factor Auth**: Add 2FA support
5. **User Profile**: Extend user model with additional fields
