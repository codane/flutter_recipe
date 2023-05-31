class Recipe {
  final String title;
  final String ingredients;
  final String preparation;
  final String url;

  Recipe({required this.title, required this.ingredients, required this.preparation, required this.url});

  Recipe.fromJson(Map<String, Object?> recipeMap) 
  : this (
    title: recipeMap['title']! as String,
    ingredients: recipeMap['ingredients']! as String,
    preparation: recipeMap['preparation']! as String,
    url: recipeMap['url']! as String
  );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'ingridients': ingredients,
      'preparation': preparation,
      'url': url
    };
  }
}