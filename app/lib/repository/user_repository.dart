import 'dart:developer';

import 'package:fitapp_domain/domain.dart';

/// Implements User Repository for managing user actions.
class UserRepository implements IUserRepository {
  UserRepository._({required IStorageRepository<User> storageRepository})
      : _storageRepository = storageRepository;

  /// A storage which implements reading and saving data.
  late final IStorageRepository<User> _storageRepository;

  /// Instance of a user.
  late User? _user;

  /// Asynchronous constructor of UserRepository
  static Future<UserRepository> instance({
    required IStorageRepository<User> storageRepository,
  }) async {
    try {
      final userRepository =
          UserRepository._(storageRepository: storageRepository);

      await userRepository._init();

      return userRepository;
    } on Exception catch (exception) {
      log('Could not create an instance of UserRepository');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Initializes user.
  Future<void> _init() async {
    await readUser();
  }

  @override
  User? get user => _user;

  /// Creates new user.
  @override
  void createUser({required double userWeight}) {
    _user = User.create(weight: userWeight);
  }

  /// Reads user info from a storage.
  @override
  Future<void> readUser() async {
    _user = await _storageRepository.read();
  }

  /// Saves user info in a storage.
  @override
  Future<void> saveUser() async {
    if (_user == null) {
      return;
    }
    await _storageRepository.save(_user!);
  }

  /// Updates user info.
  @override
  void updateUser({required User updatedUser}) => _user = updatedUser;
}
