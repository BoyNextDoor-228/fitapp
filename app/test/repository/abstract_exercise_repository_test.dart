// import 'dart:io';
//
// import 'package:app/repository/abstract_exercise_hive_storage_repository.dart';
// import 'package:app/repository/abstract_exercise_repository.dart';
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
// import 'package:test/test.dart';
// import 'package:uuid/uuid_value.dart';
//
// import 'mock/mock_user.dart';
//
// const repsExerciseTitle = 'Test abstract exercise with reps';
// const timerExerciseTitle = 'Test abstract exercise with timer';
//
// const repsExerciseDescription =
//     'Description of a test abstract exercise with reps';
//
// final testRepsExerciseUuid =
//     UuidValue.fromString('191b3518-ede2-11ef-8300-a3504b8d50ff');
//
// final testTimerExerciseUuid =
//     UuidValue.fromString('291b3518-ede2-11ef-8300-a3504b8d50ff');
//
// final testAbstractExerciseWithReps = AbstractExercise.withReps(
//   title: repsExerciseTitle,
//   description: repsExerciseDescription,
// ).copyWith(
//   id: testRepsExerciseUuid,
// );
//
// final testAbstractExerciseWithTimer = AbstractExercise.withTimer(
//   title: timerExerciseTitle,
//   description: null,
// ).copyWith(
//   id: testTimerExerciseUuid,
// );
//
// final updatedAbstractExercises = mockAbstractExercises
//     .map(
//       (abstractExercise) => abstractExercise.copyWith(
//         title: 'Edited title of an abstract exercise',
//       ),
//     )
//     .toList();
//
// /// Testing ProductsRepository implementation.
// void main() async {
//   final abstractExerciseRepository = await initAbstractExerciseRepository();
//
//   /// Tests absence of abstract exercises in Hive
//   /// because of absence of .hive file.
//   // Before running this group, make sure file
//   // 'test_fitapp_abstract_exercises_box.hive' doesn't exist
//   group("Abstract exercises' very first initialization.", () {
//     late bool areAbstractExercisesAbsent;
//
//     setUp(() {
//       areAbstractExercisesAbsent =
//           abstractExerciseRepository.abstractExercises.isEmpty;
//     });
//
//     test('List of abstract exercises is empty', () {
//       expect(areAbstractExercisesAbsent, isTrue);
//     });
//   });
//
//   /// Tests new abstract exercise creating.
//   group('Creating new abstract exercise.', () {
//     late AbstractExercise expectedAbstractExerciseWithReps;
//     late AbstractExercise actualAbstractExerciseWithReps;
//
//     late AbstractExercise expectedAbstractExerciseWithTimer;
//     late AbstractExercise actualAbstractExerciseWithTimer;
//
//     setUp(() {
//       expectedAbstractExerciseWithReps = testAbstractExerciseWithReps;
//       expectedAbstractExerciseWithTimer = testAbstractExerciseWithTimer;
//
//       actualAbstractExerciseWithReps = abstractExerciseRepository
//           .createAbstractExercise(
//             loadType: ExerciseLoadType.repetition,
//             title: repsExerciseTitle,
//             description: repsExerciseDescription,
//           )
//           .copyWith(
//             id: testRepsExerciseUuid,
//           );
//
//       actualAbstractExerciseWithTimer = abstractExerciseRepository
//           .createAbstractExercise(
//             loadType: ExerciseLoadType.timer,
//             title: timerExerciseTitle,
//             description: null,
//           )
//           .copyWith(
//             id: testTimerExerciseUuid,
//           );
//     });
//
//     test('Creating new abstract exercise with reps', () {
//       expect(
//         actualAbstractExerciseWithReps,
//         equals(expectedAbstractExerciseWithReps),
//       );
//     });
//
//     test('Creating new abstract exercise with timer', () {
//       expect(
//         actualAbstractExerciseWithTimer,
//         equals(expectedAbstractExerciseWithTimer),
//       );
//     });
//   });
//
//   group('Updating abstract exercises.', () {
//     late List<AbstractExercise> expectedAbstractExercises;
//     late List<AbstractExercise> actualAbstractExercises;
//
//     setUp(() {
//       expectedAbstractExercises = updatedAbstractExercises;
//
//       abstractExerciseRepository.updateAbstractExercises(
//         updatedAbstractExercises: updatedAbstractExercises,
//       );
//       actualAbstractExercises = abstractExerciseRepository.abstractExercises;
//     });
//
//     test('Updating abstract exercises', () {
//       expect(actualAbstractExercises, equals(expectedAbstractExercises));
//     });
//   });
//
//   group('Saving abstract exercises.', () {
//     var hasSavingSucceed = false;
//
//     setUp(() async {
//       await abstractExerciseRepository.saveAbstractExercises();
//       hasSavingSucceed = true;
//     });
//
//     test('Saving abstract exercises', () {
//       expect(hasSavingSucceed, isTrue);
//     });
//   });
//
//   /// Reading abstract exercises from a storage.
//   group('Reading saved abstract exercises.', () {
//     late List<AbstractExercise> expectedAbstractExercises;
//     late List<AbstractExercise> actualAbstractExercises;
//
//     setUp(() async {
//       expectedAbstractExercises = updatedAbstractExercises;
//
//       await abstractExerciseRepository.readAbstractExercises();
//       actualAbstractExercises = abstractExerciseRepository.abstractExercises;
//     });
//
//     test('Reading saved abstract exercises', () {
//       expect(actualAbstractExercises, equals(expectedAbstractExercises));
//     });
//   });
// }
//
// Future<AbstractExerciseRepository> initAbstractExerciseRepository() async {
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
//   return AbstractExerciseRepository.instance(
//     storageRepository: storageRepository,
//   );
// }
