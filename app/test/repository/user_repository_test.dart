import 'dart:io';

import 'package:app/repository/user_hive_storage_repository.dart';
import 'package:app/repository/user_repository.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import 'mock/mock_user.dart';

final testUserUuidValue =
    UuidValue.fromString('191b3518-ede2-11ef-8300-a3504b8d50ff');

const testUserInitialWeight = 100.0;

/// Testing UserStorageRepository implementation with Hive.
///
/// First group tests absence of user in Hive because of absence of
/// .hive file.
///
/// Second group tests saving mock user in Hive storage.
///
/// Third group tests reading user from Hive storage and parsing
/// red data into [User] model.
void main() async {
  final userRepository = await initUserRepository();

  // Before running this group, make sure file 'test_fitapp_user_box.hive'
  // doesn't exist.
  group("User Repository test. User's very first initialization.", () {
    late bool isUserAbsent;

    setUp(() {
      isUserAbsent = userRepository.user == null;
    });

    test('User is absent and equal null.', () {
      expect(isUserAbsent, isTrue);
    });
  });

  group('User Repository test. Creating a new user.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() {
      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
      );

      userRepository.createUser(userWeight: testUserInitialWeight);

      actualUser = userRepository.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Creating a new user.', () async {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Repository test: updating user.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      expectedUser = mockUser;

      userRepository.updateUser(updatedUser: mockUser);

      actualUser = userRepository.user;
    });

    test('Updating user', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Repository test: saving user.', () {
    var isSuccess = false;

    setUp(() async {
      await userRepository.saveUser();
      isSuccess = true;
    });

    test('Saving user', () {
      expect(isSuccess, isTrue);
    });
  });

  // Before running this group, make sure file 'test_fitapp_user_box.hive'
  // exists.
  group('User Repository test. Reading existing user.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      expectedUser = mockUser;

      await userRepository.readUser();
      actualUser = userRepository.user;
    });

    test('User is presented and successfully parsed.', () {
      expect(actualUser, equals(expectedUser));
    });
  });
}

Future<UserRepository> initUserRepository() async {
  final path = Directory.current.path;
  Hive.init(path);

  final storageRepository = UserHiveStorageRepository(
    userStorageBoxName: 'test_fitapp_user_box',
    userKey: 'test_fitapp_user_key',
    storagePath: path,
  );

  await storageRepository.clearStorage();

  return UserRepository.instance(storageRepository: storageRepository);
}
