import 'dart:convert';
import 'dart:developer';

import 'package:fitapp_domain/domain.dart';
import 'package:hive/hive.dart';

import '../tool/delete_hive_box_by_name.dart';

/// Implements Hive Storage Repository for storing user information.
class UserHiveStorageRepository implements IStorageRepository<User> {
  UserHiveStorageRepository({
    required this.userStorageBoxName,
    required this.userKey,
    required this.storagePath,
  });

  /// Name of [Hive] box, where user info is stored in.
  final String userStorageBoxName;

  /// The key, which can be used for getting access to user record in box.
  final String userKey;

  /// Path to storage file.
  final String storagePath;

  /// Reads and returns [User] from a storage.
  ///
  /// Returns [Null], if no user presented in storage.
  @override
  Future<User?> read() async => _readUserFromHive();

  /// Saves user, passed in [loadToSave] parameter, in a storage.
  @override
  Future<void> save(User loadToSave) async => _saveUserInHive(user: loadToSave);

  /// Reads box of user from [Hive] and returns [User].
  /// If no [User] presented or failed to read box, returns null.
  ///
  /// Note: User is stored as [Map<String, dynamic>].
  Future<User?> _readUserFromHive() async {
    try {
      // Generic type of [Map] is <dynamic, dynamic> and not <String, dynamic>,
      // because, despite this type was explicitly set, Hive.openBox() will
      // return Map<dynamic, dynamic> anyway.
      final userBox = await _openUserBox<Map<dynamic, dynamic>>();

      if (userBox.values.isEmpty) {
        return null;
      }

      // Raw user means it is not ready yet for returning from function.
      final rawUser = userBox.values.first;

      final user = _mapUser(rawUser);
      await userBox.close();

      return user;
    } on Exception catch (exception) {
      log('Could not read user from Hive.');
      log('Exception message: $exception');
      return null;
    }
  }

  /// Saves load, passed in [user] parameter, in [Hive] user box.
  Future<void> _saveUserInHive({required User user}) async {
    try {
      final userBox = await _openUserBox<Map<dynamic, dynamic>>();
      final userJson = user.toJson();

      await userBox.put(userKey, userJson);

      await userBox.close();
    } on Exception catch (exception) {
      log('Caught an exception during saving user in Hive.\nUser is: $user');
      log('Exception message: $exception');
    }
  }

  /// Opens [Hive] user box if it exists and returns it.
  ///
  /// If doesn't exist, creates it and then returns.
  Future<Box<E>> _openUserBox<E>() async {
    try {
      if (!await Hive.boxExists(userStorageBoxName)) {
        await _initStorage();
      }

      final userBox = await Hive.openBox<E>(
        userStorageBoxName,
        path: storagePath,
      );

      return userBox;
    } on Exception catch (exception) {
      log('Could not open Hive box with name $userStorageBoxName');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Maps [rawUser] from [Map<dynamic dynamic>] to [User].
  User _mapUser(Map<dynamic, dynamic> rawUser) {
    try {
      final rawUserString = jsonEncode(rawUser);

      final userJson = jsonDecode(rawUserString) as Map<String, dynamic>;

      return User.fromJson(userJson);
    } on Exception catch (exception) {
      log('Could not map raw user to User.\nrawUser is $rawUser');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Creates user box, if it doesn't exist.
  Future<void> _initStorage() async {
    try {
      if (await Hive.boxExists(userStorageBoxName)) {
        return;
      }

      final userBox = await Hive.openBox(userStorageBoxName, path: storagePath);
      await userBox.close();
    } on Exception catch (exception) {
      log('Could not initialize Hive storage.');
      log('Exception message: $exception');
    }
  }

  /// Clears [Hive] storage of [User].
  @override
  Future<void> clearStorage() =>
      deleteHiveBox(boxName: userStorageBoxName, boxPath: storagePath);
}
