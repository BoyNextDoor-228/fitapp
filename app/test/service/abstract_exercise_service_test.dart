// import 'dart:io';
//
// import 'package:app/repository/abstract_exercise_hive_storage_repository.dart';
// import 'package:app/repository/abstract_exercise_repository.dart';
// import 'package:app/service/abstract_exercise_service.dart';
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
// import 'package:test/test.dart';
// import 'package:uuid/uuid.dart';
//
// import '../repository/mock/mock_user.dart';
//
// final testAbstractExerciseWithRepsUuidValue =
//     UuidValue.fromString('5ef96711-f9a8-11ef-88a7-3b4b11c0a743');
//
// final testAbstractExerciseWithTimerUuidValue =
//     UuidValue.fromString('c3f96711-f9a8-11ef-88a7-3b4b11c0a7d2');
//
// Future<void> main() async {
//   final abstractExerciseService = await initAbstractExerciseService();
//
//   group('AbstractExercises very first initialization.', () {
//     late List<AbstractExercise> actualAbstractExercises;
//     late List<AbstractExercise> expectedAbstractExercises;
//
//     setUp(() async {
//       expectedAbstractExercises = <AbstractExercise>[];
//       actualAbstractExercises = abstractExerciseService.abstractExercises;
//     });
//
//     test('Abstract exercises are empty list.', () {
//       expect(actualAbstractExercises, equals(expectedAbstractExercises));
//     });
//   });
//
//   group('Creating a new Abstract exercise', () {
//     late AbstractExercise actualAbstractExerciseWithReps;
//     late AbstractExercise expectedAbstractExerciseWithReps;
//
//     late AbstractExercise actualAbstractExerciseWithTimer;
//     late AbstractExercise expectedAbstractExerciseWithTimer;
//
//     setUp(() async {
//       expectedAbstractExerciseWithReps = AbstractExercise.withReps(
//         title: 'test abstract exercise with reps title',
//         description: 'Test description',
//       ).copyWith(id: testAbstractExerciseWithRepsUuidValue);
//
//       actualAbstractExerciseWithReps = abstractExerciseService
//           .createAbstractExercise(
//             title: 'test abstract exercise with reps title',
//             description: 'Test description',
//             loadType: ExerciseLoadType.repetition,
//           )
//           .copyWith(id: testAbstractExerciseWithRepsUuidValue);
//
//       expectedAbstractExerciseWithTimer = AbstractExercise.withTimer(
//         title: 'test abstract exercise with timer title',
//         description: null,
//       ).copyWith(id: testAbstractExerciseWithTimerUuidValue);
//
//       actualAbstractExerciseWithTimer = abstractExerciseService
//           .createAbstractExercise(
//             title: 'test abstract exercise with timer title',
//             description: null,
//             loadType: ExerciseLoadType.timer,
//           )
//           .copyWith(id: testAbstractExerciseWithTimerUuidValue);
//     });
//
//     test('Creating a new abstract exercise with reps.', () {
//       expect(
//         actualAbstractExerciseWithReps,
//         equals(expectedAbstractExerciseWithReps),
//       );
//     });
//
//     test('Creating a new abstract exercise with timer.', () {
//       expect(
//         actualAbstractExerciseWithTimer,
//         equals(expectedAbstractExerciseWithTimer),
//       );
//     });
//   });
//
//   group('Adding a new abstract exercise.', () {
//     late List<AbstractExercise> actualAbstractExercises;
//     late List<AbstractExercise> expectedAbstractExercises;
//
//     setUp(() async {
//       final testAbstractExercise = mockAbstractExercises.first;
//
//       expectedAbstractExercises = [
//         testAbstractExercise,
//       ];
//
//       await abstractExerciseService.addAbstractExercise(
//         newAbstractExercise: testAbstractExercise,
//       );
//       actualAbstractExercises = abstractExerciseService.abstractExercises;
//     });
//
//     test('Adding a new abstract exercise.', () {
//       expect(actualAbstractExercises, equals(expectedAbstractExercises));
//     });
//   });
//
//   group('Editing an abstract exercise.', () {
//     late List<AbstractExercise> actualAbstractExercises;
//     late List<AbstractExercise> expectedAbstractExercises;
//
//     setUp(() async {
//       final testAbstractExercise = mockAbstractExercises.first;
//
//       final editedAbstractExercise = testAbstractExercise.copyWith(
//         title: 'Edited title of an abstract exercise',
//       );
//
//       expectedAbstractExercises = [
//         editedAbstractExercise,
//       ];
//
//       await abstractExerciseService.editAbstractExercise(
//         editedAbstractExercise: editedAbstractExercise,
//       );
//       actualAbstractExercises = abstractExerciseService.abstractExercises;
//     });
//
//     test('Editing an abstract exercise.', () {
//       expect(actualAbstractExercises, equals(expectedAbstractExercises));
//     });
//   });
//
//   group('Deleting an abstract exercise.', () {
//     late List<AbstractExercise> actualAbstractExercises;
//     late List<AbstractExercise> expectedAbstractExercises;
//
//     setUp(() async {
//       final abstractExerciseToDelete = mockAbstractExercises.first;
//
//       expectedAbstractExercises = <AbstractExercise>[];
//
//       await abstractExerciseService.deleteAbstractExercise(
//         abstractExerciseId: abstractExerciseToDelete.id,
//       );
//
//       actualAbstractExercises = abstractExerciseService.abstractExercises;
//     });
//
//     test('Deleting an abstract exercise.', () {
//       expect(actualAbstractExercises, equals(expectedAbstractExercises));
//     });
//   });
// }
//
// Future<AbstractExerciseService> initAbstractExerciseService() async {
//   final path = Directory.current.path;
//   Hive.init(path);
//
//   final storageRepository = AbstractExerciseHiveStorageRepository(
//     abstractExercisesStorageBoxName: 'test_fitapp_abstract_exercise_box',
//     abstractExercisesKey: 'test_fitapp_abstract_exercise_key',
//     storagePath: path,
//   );
//
//   await storageRepository.clearStorage();
//
//   final abstractExerciseRepository =
//   await AbstractExerciseRepository.instance(
//     storageRepository: storageRepository,
//   );
//
//   return AbstractExerciseService(
//     abstractExerciseRepository: abstractExerciseRepository,
//   );
// }
