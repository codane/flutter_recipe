import 'package:flutter_recipe/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider.autoDispose(
  (ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void registerUser({required String username,required String email, required String password}) async {
   _authRepository.registerUser(username: username, email: email, password: password);

  }

  void loginUser({required String email, required String password}) {
    _authRepository.loginUser(email: email, password: password);
  }

  void signOut() {
    _authRepository.signOut();
  }

  bool isUserLoggedIn() {
   return _authRepository.isUserLoggedIn();
  }

  // Stream? userStatus() => _authRepository.userStatus();
  Stream get userStatus => _authRepository.userStatus;
}
