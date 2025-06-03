// import 'package:fitapp_domain/domain.dart';
//
// /// Implements Products repository for managing products.
// class ProductRepository implements IProductRepository {
//   ProductRepository._({
//     required IStorageRepository<List<Product>> storageRepository,
//   }) : _storageRepository = storageRepository;
//
//   /// A storage which implements reading and saving data.
//   late final IStorageRepository<List<Product>> _storageRepository;
//
//   /// List of products which current repository manages.
//   late List<Product> _products;
//
//   /// Asynchronous constructor of [ProductRepository].
//   static Future<ProductRepository> instance({
//     required IStorageRepository<List<Product>> storageRepository,
//   }) async {
//     final productRepository = ProductRepository._(
//       storageRepository: storageRepository,
//     );
//
//     await productRepository._init();
//
//     return productRepository;
//   }
//
//   @override
//   List<Product> get products => _products;
//
//   /// Initializes [_products].
//   Future<void> _init() async => readProducts();
//
//   /// Creates new product.
//   @override
//   Product createProduct({
//     required String name,
//     required NutritionFacts nutritionFacts,
//   }) =>
//       Product.create(
//         name: name,
//         nutritionFacts: nutritionFacts,
//       );
//
//   /// Saves [_products] in a storage.
//   @override
//   Future<void> saveProducts() async {
//     await _storageRepository.save(_products);
//   }
//
//   /// Reads products from a storage.
//   ///
//   /// If reading failed, sets [_products] as empty list.
//   @override
//   Future<void> readProducts() async {
//     _products = await _storageRepository.read() ?? <Product>[];
//   }
//
//   /// Updates [_products] list with list passed in [updatedProducts] parameter.
//   @override
//   void updateProductsList({required List<Product> updatedProducts}) =>
//       _products = updatedProducts;
// }
