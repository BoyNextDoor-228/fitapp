// import 'dart:convert';
//
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
//
// import '../tool/delete_hive_box_by_name.dart';
//
// /// Implements Hive Storage Repository for storing products.
// class ProductHiveStorageRepository
//     implements IStorageRepository<List<Product>> {
//   ProductHiveStorageRepository({
//     required this.productsStorageBoxName,
//     required this.productsKey,
//     required this.storagePath,
//   });
//
//   /// Name of [Hive] box, where products are stored in.
//   final String productsStorageBoxName;
//
//   /// The key, which can be used for getting access to products record in box.
//   final String productsKey;
//
//   /// Path to storage file.
//   final String storagePath;
//
//   @override
//   Future<List<Product>?> read() async => _readProductsFromHive();
//
//   @override
//   Future<void> save(List<Product> loadToSave) async =>
//       _saveProductsInHive(products: loadToSave);
//
//   /// Reads box of products from [Hive] and returns [List] of [Product].
//   ///
//   /// Products are stored as [List] of [dynamic]
//   Future<List<Product>?> _readProductsFromHive() async {
//     // Generic type of [List] is <dynamic> and not List<<String, dynamic>>,
//     // because, despite this type was explicitly set, Hive.openBox() will
//     // return List<dynamic> anyway.
//     final productsBox = await _openProductsBox<List<dynamic>>();
//
//     // Raw products means they are not ready yet for returning from function.
//     final rawProducts = productsBox.get(productsKey);
//
//     if (rawProducts == null) {
//       await productsBox.close();
//
//       return null;
//     }
//
//     final products = _mapProducts(rawProducts);
//     await productsBox.close();
//
//     return products;
//   }
//
//   /// Saves products list, passed in [products] parameter,
//   /// in [Hive] products box.
//   Future<void> _saveProductsInHive({required List<Product> products}) async {
//     final productsBox = await _openProductsBox<List<dynamic>>();
//
//     // Raw products means they are not ready yet for returning from function.
//     final rawProducts =
//         products.map((Product product) => product.toJson()).toList();
//
//     await productsBox.put(productsKey, rawProducts);
//
//     await productsBox.close();
//   }
//
//   /// Opens [Hive] products box if it exists and returns it.
//   ///
//   /// If doesn't exist, creates it and then returns.
//   Future<Box<E>> _openProductsBox<E>() async {
//     if (!await Hive.boxExists(productsStorageBoxName, path: storagePath)) {
//       await _initStorage();
//     }
//
//     final productsBox = await Hive.openBox<E>(
//       productsStorageBoxName,
//       path: storagePath,
//     );
//
//     return productsBox;
//   }
//
//   /// Maps [rawProducts] from [List] of [dynamic] to [List] of [Product].
//   List<Product> _mapProducts(List<dynamic> rawProducts) {
//     // Turning list of rawProducts into list of strings with .jsonEncode().
//     final rawProductsStringsList = rawProducts.map(jsonEncode).toList();
//
//     // Making list of Map<String, dynamic>
//     final productsJsonList = rawProductsStringsList
//         .map<Map<String, dynamic>>(
//           (rawProductsString) =>
//               jsonDecode(rawProductsString) as Map<String, dynamic>,
//         )
//         .toList();
//
//     // Returning list of products.
//     return productsJsonList.map(Product.fromJson).toList();
//   }
//
//   /// Creates products box, if it doesn't exist.
//   Future<void> _initStorage() async {
//     if (await Hive.boxExists(productsStorageBoxName, path: storagePath)) {
//       return;
//     }
//
//     final productsBox = await Hive.openBox(
//       productsStorageBoxName,
//       path: storagePath,
//     );
//     await productsBox.close();
//   }
//
//   /// Clears [Hive] storage of [Product]-s.
//   @override
//   Future<void> clearStorage() =>
//       deleteHiveBox(boxName: productsStorageBoxName, boxPath: storagePath);
// }
