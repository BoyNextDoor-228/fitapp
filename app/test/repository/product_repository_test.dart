// import 'dart:io';
//
// import 'package:app/repository/product_hive_storage_repository.dart';
// import 'package:app/repository/product_repository.dart';
//
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
// import 'package:test/test.dart';
// import 'package:uuid/uuid.dart';
//
// import 'mock/mock_products.dart';
//
// final testProductUuidValue =
//     UuidValue.fromString('c91b3518-ede2-11ef-8300-a3504b8d50ff');
//
// const nutritionFacts = NutritionFacts(
//   proteins: 10,
//   fats: 10,
//   carbohydrates: 40,
//   kilocalories: 500,
// );
//
// final testProduct = Product.create(
//   name: 'Test product',
//   nutritionFacts: nutritionFacts,
// ).copyWith(
//   id: testProductUuidValue,
// );
//
// /// Testing ProductsRepository implementation.
// void main() async {
//   final productRepository = await initProductRepository();
//
//   /// Tests absence of products in Hive because of absence of .hive file.
//   // Before running this group, make sure file 'test_fitapp_products_box.hive'
//   // doesn't exist
//   group("Product Repository test. Products' very first initialization.", () {
//     late bool productsAreAbsent;
//
//     setUp(() async {
//       productsAreAbsent = productRepository.products.isEmpty;
//     });
//
//     test('List of products is empty', () {
//       expect(productsAreAbsent, isTrue);
//     });
//   });
//
//   /// Tests new product creating.
//   group('Product Repository test: creating new product.', () {
//     late Product expectedProduct;
//     late Product actualProduct;
//
//     setUp(() {
//       expectedProduct = testProduct;
//
//       actualProduct = productRepository
//           .createProduct(
//             name: 'Test product',
//             nutritionFacts: nutritionFacts,
//           )
//           .copyWith(
//             id: testProductUuidValue,
//           );
//     });
//
//     test('Creating new product', () {
//       expect(actualProduct, equals(expectedProduct));
//     });
//   });
//
//   group('Product Repository test: Updating products list.', () {
//     late List<Product> expectedProducts;
//     late List<Product> actualProducts;
//
//     setUp(() {
//       expectedProducts = [testProduct];
//
//       productRepository.updateProductsList(
//         updatedProducts: [testProduct],
//       );
//
//       actualProducts = productRepository.products;
//     });
//
//     test('Updating products list', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
//
//   /// Tests saving product in a storage.
//   group('Product Repository test: Saving products list.', () {
//     late List<Product> expectedProducts;
//     late List<Product> actualProducts;
//
//     setUp(() async {
//       final testProducts = mockProducts;
//
//       expectedProducts = testProducts;
//
//       productRepository.updateProductsList(
//         updatedProducts: testProducts,
//       );
//
//       await productRepository.saveProducts();
//
//       await productRepository.readProducts();
//
//       actualProducts = productRepository.products;
//     });
//
//     test('Saving products', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
//
//   /// Tests reading products from a storage.
//   group('Product Repository test: reading saved products.', () {
//     late List<Product> expectedProducts;
//     late List<Product> actualProducts;
//
//     setUp(() async {
//       expectedProducts = mockProducts;
//
//       await productRepository.readProducts();
//       actualProducts = productRepository.products;
//     });
//
//     test('Reading saved products', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
// }
//
// Future<IProductRepository> initProductRepository() async {
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
//   return ProductRepository.instance(storageRepository: storageRepository);
// }
