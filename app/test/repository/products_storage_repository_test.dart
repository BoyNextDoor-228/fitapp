// import 'dart:io';
//
// import 'package:app/repository/product_hive_storage_repository.dart';
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
// import 'package:test/test.dart';
//
// import 'mock/mock_products.dart';
//
// /// Testing ProductsStorageRepository implementation with Hive.
// ///
// /// First group tests absence of products in Hive because of absence of
// /// .hive file.
// ///
// /// Second group tests saving mock products in Hive storage.
// ///
// /// Third group tests reading products from Hive storage and parsing
// /// red data into [Product] models.
// void main() async {
//   final storageRepository = await initStorageRepository();
//
//   // Before running this group, make sure file
//   // 'test_fitapp_product_box.hive' doesn't exist
//   group('Reading products from Hive. Products are absent', () {
//     late bool areProductsAbsent;
//
//     setUp(() async {
//       areProductsAbsent = await storageRepository.read() == null;
//     });
//
//     test('Products are absent', () async {
//       expect(areProductsAbsent, isTrue);
//     });
//   });
//
//   group('Product storage test: saving products in Hive', () {
//     var isSuccess = false;
//
//     setUp(() async {
//       await storageRepository.save(mockProducts);
//       isSuccess = true;
//     });
//
//     test('Saving products', () {
//       expect(isSuccess, isTrue);
//     });
//   });
//
//   // Before running this group, make sure file
//   // 'test_fitapp_product_box.hive' exists
//   group('Reading products from Hive. Products are presented', () {
//     late List<Product>? actualProducts;
//     late List<Product> expectedProducts;
//
//     setUp(() async {
//       expectedProducts = mockProducts;
//
//       actualProducts = await storageRepository.read();
//     });
//
//     test('Products are presented and successfully parsed.', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
// }
//
// Future<ProductHiveStorageRepository> initStorageRepository() async {
//   final path = Directory.current.path;
//   Hive.init(path);
//
//   final storageRepository = ProductHiveStorageRepository(
//     productsStorageBoxName: 'test_fitapp_products_box',
//     productsKey: 'test_fitapp_products_key',
//     storagePath: path,
//   );
//
//   await storageRepository.clearStorage();
//
//   return storageRepository;
// }
