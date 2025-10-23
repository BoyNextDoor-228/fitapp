import '../../domain.dart';

/// Abstract repository to handle actions on a [User].
abstract class IUserRepository {
  User? get user;

  void createUser({required double userWeight});

  void updateUser({required User updatedUser});

  Future<void> readUser();

  Future<void> saveUser();
}
