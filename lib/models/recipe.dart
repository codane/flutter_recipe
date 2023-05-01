class Recipe {
  final String title;
  final String ingridients;
  final String preparation;
  final String url;

  Recipe({required this.title, required this.ingridients, required this.preparation, required this.url});

  Recipe.fromJson(Map<String, Object?> recipeMap) 
  : this (
    title: recipeMap['title']! as String,
    ingridients: recipeMap['ingridients']! as String,
    preparation: recipeMap['preparation']! as String,
    url: recipeMap['url']! as String
  );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'ingridients': ingridients,
      'preparation': preparation,
      'url': url
    };
  }
}