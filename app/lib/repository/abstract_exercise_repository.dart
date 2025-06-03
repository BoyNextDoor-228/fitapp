// import 'package:fitapp_domain/domain.dart';
//
// import '../exception/unknown_exercise_load_type_exception.dart';
//
// /// Implements AbstractExercise repository for managing abstract exercises.
// class AbstractExerciseRepository implements IAbstractExerciseRepository {
//   AbstractExerciseRepository._({
//     required IStorageRepository<List<AbstractExercise>> storageRepository,
//   }) : _storageRepository = storageRepository;
//
//   /// A storage which implements reading and saving data.
//   late final IStorageRepository<List<AbstractExercise>> _storageRepository;
//
//   /// List of abstract exercises which current repository manages.
//   late List<AbstractExercise> _abstractExercises;
//
//   /// Asynchronous constructor of [AbstractExerciseRepository].
//   static Future<AbstractExerciseRepository> instance({
//     required IStorageRepository<List<AbstractExercise>> storageRepository,
//   }) async {
//     final abstractExerciseRepository = AbstractExerciseRepository._(
//       storageRepository: storageRepository,
//     );
//
//     await abstractExerciseRepository._init();
//
//     return abstractExerciseRepository;
//   }
//
//   @override
//   List<AbstractExercise> get abstractExercises => _abstractExercises;
//
//   /// Initializes [_abstractExercises].
//   Future<void> _init() async => readAbstractExercises();
//
//   /// Creates new [AbstractExercise].
//   @override
//   AbstractExercise createAbstractExercise({
//     required ExerciseLoadType loadType,
//     required String title,
//     required String? description,
//   }) {
//     if (loadType == ExerciseLoadType.repetition) {
//       return AbstractExercise.withReps(
//         title: title,
//         description: description,
//       );
//     }
//     if (loadType == ExerciseLoadType.timer) {
//       return AbstractExercise.withTimer(
//         title: title,
//         description: description,
//       );
//     }
//
//     throw UnknownExerciseLoadTypeException();
//   }
//
//   /// Saves [_abstractExercises] in a storage.
//   @override
//   Future<void> saveAbstractExercises() async {
//     await _storageRepository.save(_abstractExercises);
//   }
//
//   /// Reads abstract exercises from a storage.
//   ///
//   /// If reading failed, sets [_abstractExercises] as empty list.
//   @override
//   Future<void> readAbstractExercises() async {
//     _abstractExercises =
//         await _storageRepository.read() ?? <AbstractExercise>[];
//   }
//
//   @override
//   void updateAbstractExercises({
//     required List<AbstractExercise> updatedAbstractExercises,
//   }) =>
//       _abstractExercises = updatedAbstractExercises;
// }
