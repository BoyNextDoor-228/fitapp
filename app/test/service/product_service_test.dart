// import 'dart:io';
//
// import 'package:app/repository/product_hive_storage_repository.dart';
// import 'package:app/repository/product_repository.dart';
// import 'package:app/service/product_service.dart';
// import 'package:fitapp_domain/domain.dart';
// import 'package:hive/hive.dart';
// import 'package:test/test.dart';
// import 'package:uuid/uuid_value.dart';
//
// import '../repository/mock/mock_products.dart';
//
// final testProductUuidValue =
//     UuidValue.fromString('9bf96711-f9a8-11ef-88a7-3b4b11c0a7b6');
//
// Future<void> main() async {
//   final productService = await initProductService();
//
//   group('Product Service test. Products very first initialization.', () {
//     late List<Product> actualProducts;
//     late List<Product> expectedProducts;
//
//     setUp(() async {
//       expectedProducts = <Product>[];
//       actualProducts = productService.products;
//     });
//
//     test('Products are empty list.', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
//
//   group('Product Service test. Creating a new product.', () {
//     late Product actualProduct;
//     late Product expectedProduct;
//
//     setUp(() async {
//       const testNutritionFacts = NutritionFacts(
//         proteins: 9,
//         fats: 10,
//         carbohydrates: 30,
//         kilocalories: 400,
//       );
//       const testProductName = 'Test product';
//
//       expectedProduct = Product.create(
//         name: testProductName,
//         nutritionFacts: testNutritionFacts,
//       ).copyWith(id: testProductUuidValue);
//
//       actualProduct = productService
//           .createProduct(
//             name: testProductName,
//             nutritionFacts: testNutritionFacts,
//           )
//           .copyWith(id: testProductUuidValue);
//     });
//
//     test('Creating a  new product.', () {
//       expect(actualProduct, equals(expectedProduct));
//     });
//   });
//
//   group('Product Service test. Adding a new product.', () {
//     late List<Product> actualProducts;
//     late List<Product> expectedProducts;
//
//     setUp(() async {
//       final testProduct = mockProducts.first;
//
//       expectedProducts = [
//         testProduct,
//       ];
//
//       await productService.addProduct(newProduct: testProduct);
//       actualProducts = productService.products;
//     });
//
//     test('Adding a new product.', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
//
//   group('Product Service test. Editing a product.', () {
//     late List<Product> actualProducts;
//     late List<Product> expectedProducts;
//
//     setUp(() async {
//       final testProduct = mockProducts.first;
//
//       final editedProduct = testProduct.copyWith(
//         name: 'Edited name of a product',
//       );
//
//       expectedProducts = [
//         editedProduct,
//       ];
//
//       await productService.editProduct(editedProduct: editedProduct);
//       actualProducts = productService.products;
//     });
//
//     test('Editing a product.', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
//
//   group('Product Service test. Deleting a product.', () {
//     late List<Product> actualProducts;
//     late List<Product> expectedProducts;
//
//     setUp(() async {
//       final productToDelete = mockProducts.first;
//
//       expectedProducts = <Product>[];
//
//       await productService.deleteProduct(productId: productToDelete.id);
//       actualProducts = productService.products;
//     });
//
//     test('Deleting a product.', () {
//       expect(actualProducts, equals(expectedProducts));
//     });
//   });
// }
//
// Future<ProductService> initProductService() async {
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
//   final productRepository =
//       await ProductRepository.instance(storageRepository: storageRepository);
//
//   return ProductService(productRepository: productRepository);
// }
