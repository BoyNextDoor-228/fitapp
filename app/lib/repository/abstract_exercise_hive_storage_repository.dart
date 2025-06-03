// import 'dart:convert';
//
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
//
// import '../tool/delete_hive_box_by_name.dart';
//
// /// Implements Hive Storage Repository for storing abstract exercises.
// class AbstractExerciseHiveStorageRepository
//     implements IStorageRepository<List<AbstractExercise>> {
//   AbstractExerciseHiveStorageRepository({
//     required this.abstractExercisesStorageBoxName,
//     required this.abstractExercisesKey,
//     required this.storagePath,
//   });
//
//   /// Name of [Hive] box, where abstract exercises are stored in.
//   final String abstractExercisesStorageBoxName;
//
//   /// The key, which can be used for getting access to abstract exercises
//   /// record in box.
//   final String abstractExercisesKey;
//
//   /// Path to storage file.
//   final String storagePath;
//
//   @override
//   Future<List<AbstractExercise>?> read() async =>
//       _readAbstractExercisesFromHive();
//
//   @override
//   Future<void> save(List<AbstractExercise> loadToSave) async =>
//       _saveAbstractExercisesInHive(abstractExercises: loadToSave);
//
//   /// Reads box of products from [Hive] and returns
//   /// [List] of [AbstractExercise].
//   ///
//   /// Abstract exercises are stored as [List] of [dynamic]
//   Future<List<AbstractExercise>?> _readAbstractExercisesFromHive() async {
//     // Generic type of [List] is <dynamic> and not List<<String, dynamic>>,
//     // because, despite this type was explicitly set, Hive.openBox() will
//     // return List<dynamic> anyway.
//     final abstractExercisesBox =
//         await _openAbstractExercisesBox<List<dynamic>>();
//
//     // Raw abstract exercises mean they are not ready yet for returning
//     // from function.
//     final rawAbstractExercises =
//     abstractExercisesBox.get(abstractExercisesKey);
//
//     if (rawAbstractExercises == null) {
//       await abstractExercisesBox.close();
//
//       return null;
//     }
//
//     final abstractExercises = _mapAbstractExercises(rawAbstractExercises);
//     await abstractExercisesBox.close();
//
//     return abstractExercises;
//   }
//
//   /// Saves abstract exercises list, passed in [abstractExercises] parameter,
//   /// in [Hive] abstract exercises box.
//   Future<void> _saveAbstractExercisesInHive({
//     required List<AbstractExercise> abstractExercises,
//   }) async {
//     final abstractExercisesBox =
//         await _openAbstractExercisesBox<List<dynamic>>();
//
//     // Raw abstract exercises mean they are not ready yet for
//     // returning from function.
//     final rawAbstractExercises = abstractExercises
//         .map(
//           (AbstractExercise abstractExercise) => abstractExercise.toJson(),
//         )
//         .toList();
//
//     await abstractExercisesBox.put(
//     abstractExercisesKey,
//     rawAbstractExercises,
//     );
//
//     await abstractExercisesBox.close();
//   }
//
//   /// Opens [Hive] abstract exercises box, if it exists, and returns it.
//   ///
//   /// If doesn't exist, creates it and then returns.
//   Future<Box<E>> _openAbstractExercisesBox<E>() async {
//     if (!await Hive.boxExists(
//       abstractExercisesStorageBoxName,
//       path: storagePath,
//     )) {
//       await _initStorage();
//     }
//
//     final abstractExercisesBox = await Hive.openBox<E>(
//       abstractExercisesStorageBoxName,
//       path: storagePath,
//     );
//
//     return abstractExercisesBox;
//   }
//
//   /// Maps [rawAbstractExercises] from [List] of [dynamic]
//   /// to [List] of [AbstractExercise].
//   List<AbstractExercise> _mapAbstractExercises(
//     List<dynamic> rawAbstractExercises,
//   ) {
//     // Turning list of rawAbstractExercises into list of strings with
//     // .jsonEncode().
//     final rawAbstractExercisesStringsList =
//         rawAbstractExercises.map(jsonEncode).toList();
//
//     // Making list of Map<String, dynamic>
//     final abstractExercisesJsonList = rawAbstractExercisesStringsList
//         .map<Map<String, dynamic>>(
//           (rawAbstractExerciseString) =>
//               jsonDecode(rawAbstractExerciseString) as Map<String, dynamic>,
//         )
//         .toList();
//
//     // Returning list of abstract exercises.
//     return abstractExercisesJsonList.map(AbstractExercise.fromJson).toList();
//   }
//
//   /// Creates abstract exercises box, if it doesn't exist.
//   Future<void> _initStorage() async {
//     if (await Hive.boxExists(
//       abstractExercisesStorageBoxName,
//       path: storagePath,
//     )) {
//       return;
//     }
//
//     final abstractExercisesBox =
//         await Hive.openBox(abstractExercisesStorageBoxName,
//         path: storagePath,
//         );
//     await abstractExercisesBox.close();
//   }
//
//   /// Clears [Hive] storage of [AbstractExercise]-s.
//   @override
//   Future<void> clearStorage() => deleteHiveBox(
//         boxName: abstractExercisesStorageBoxName,
//         boxPath: storagePath,
//       );
// }
