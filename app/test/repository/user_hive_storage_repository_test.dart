import 'dart:io';

import 'package:app/repository/user_hive_storage_repository.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';

import 'mock/mock_user.dart';

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
  final storageRepository = await initStorageRepository();

  // Before running this group, make sure file 'test_fitapp_user_box.hive'
  // doesn't exist
  group('Reading user from Hive. User is absent', () {
    late bool isUserAbsent;

    setUp(() async {
      isUserAbsent = await storageRepository.read() == null;
    });

    test('User is absent and equal null.', () {
      expect(isUserAbsent, isTrue);
    });
  });

  group('User storage test: saving user in Hive', () {
    var isSuccess = false;

    setUp(() async {
      await storageRepository.save(mockUser);
      isSuccess = true;
    });

    test('Saving user', () {
      expect(isSuccess, isTrue);
    });
  });

  // Before running this group, make sure file 'test_fitapp_user_box.hive'
  // exists.
  group('Reading user from Hive. User is presented', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      expectedUser = mockUser;

      actualUser = await storageRepository.read();
    });

    test('User is presented and successfully parsed.', () async {
      expect(actualUser, equals(expectedUser));
    });
  });
}

Future<UserHiveStorageRepository> initStorageRepository() async {
  final path = Directory.current.path;
  Hive.init(path);

  final storageRepository = UserHiveStorageRepository(
    userStorageBoxName: 'test_fitapp_user_box',
    userKey: 'test_fitapp_user_key',
    storagePath: path,
  );

  await storageRepository.clearStorage();

  return storageRepository;
}
