import '../../domain.dart';
import '../nutrition/nutrition.dart';

abstract class IProductRepository {
  List<Product> get products;

  Product createProduct({
    required String name,
    required NutritionFacts nutritionFacts,
  });

  void updateProductsList({required List<Product> updatedProducts});

  Future<void> readProducts();

  Future<void> saveProducts();
}
