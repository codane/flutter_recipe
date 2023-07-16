import 'package:flutter_recipe/features/db/repository/db_repository.dart';
import 'package:flutter_recipe/models/recipe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbControllerProvider = Provider.autoDispose(
  (ref) => DbController(
    dbRepository: ref.read(dbRepositoryProvider),
  ),
);

class DbController {
  final DbRepository _dbRepository;

  DbController({required DbRepository dbRepository})
      : _dbRepository = dbRepository;


  void addNewRecipe({required Recipe newRecipe}) async {
    _dbRepository.addNewRecipe(newRecipe: newRecipe);
  }

  void deleteRecipe({required String recipeId}) async {
    _dbRepository.deleteRecipe(recipeId: recipeId);
  }
}
