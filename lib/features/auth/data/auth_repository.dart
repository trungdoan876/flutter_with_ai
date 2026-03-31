import '../domain/user_model.dart';
import 'package:uuid/uuid.dart';

class AuthRepository {
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (email == 'test@example.com' && password == 'password123') {
      return UserModel(
        id: const Uuid().v4(),
        email: email,
        name: 'Test Intern',
      );
    } else {
      throw Exception('Invalid email or password!');
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
