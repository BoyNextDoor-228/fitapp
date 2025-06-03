// import 'dart:io';
//
// import 'package:app/repository/abstract_exercise_hive_storage_repository.dart';
//
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
// import 'package:test/test.dart';
//
// import 'mock/mock_user.dart';
//
// /// Testing AbstractExerciseStorageRepository implementation with Hive.
// ///
// /// First group tests absence of abstract exercises in Hive because of
// /// absence of .hive file.
// ///
// /// Second group tests saving mock abstract exercises in Hive storage.
// ///
// /// Third group tests reading abstract exercises from Hive storage and parsing
// /// red data into [AbstractExercise] models.
// void main() async {
//   final storageRepository = await initAbstractStorageRepository();
//
//   // Before running this group, make sure file
//   // 'test_fitapp_abstract_exercise_box.hive' doesn't exist
//   group('Reading abstract exercises from Hive. Exercises are absent', () {
//     late bool areExercisesAbsent;
//
//     setUp(() async {
//       areExercisesAbsent = await storageRepository.read() == null;
//     });
//
//     test('Exercises are absent.', () {
//       expect(areExercisesAbsent, isTrue);
//     });
//   });
//
//   group('Abstract exercises storage test: saving exercises in Hive', () {
//     var isSuccess = false;
//
//     test('Saving exercises', () async {
//       await storageRepository.save(mockAbstractExercises);
//       isSuccess = true;
//       expect(isSuccess, isTrue);
//     });
//   });
//
//   // Before running this group, make sure file
//   // 'test_fitapp_abstract_exercise_box.hive' exists
//   group('Reading abstract exercises from Hive. Exercises are presented', () {
//     late List<AbstractExercise>? expectedExercises;
//     late List<AbstractExercise> actualExercises;
//
//     setUp(() async {
//       expectedExercises = mockAbstractExercises;
//       actualExercises = await storageRepository.read();
//     });
//
//     test('Abstract exercises are presented and successfully parsed.', () {
//       expect(actualExercises, equals(expectedExercises));
//     });
//   });
// }
//
// Future<IStorageRepository> initAbstractStorageRepository() async {
//   final path = Directory.current.path;
//   Hive.init(path);
//
//   final storageRepository = AbstractExerciseHiveStorageRepository(
//     abstractExercisesStorageBoxName: 'test_fitapp_abstract_exercises_box',
//     abstractExercisesKey: 'test_fitapp_abstract_exercises_key',
//     storagePath: path,
//   );
//
//   await storageRepository.clearStorage();
//
//   return storageRepository;
// }
