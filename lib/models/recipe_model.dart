class Recipe {
  String id;
  final String title;
  final String ingredients;
  final String preparation;
  final String url;

  Recipe({this.id = '', required this.title, required this.ingredients, required this.preparation, required this.url});

  Recipe.fromJson(Map<String, Object?> recipeMap) 
  : this (
    id: recipeMap['id']! as String,
    title: recipeMap['title']! as String,
    ingredients: recipeMap['ingredients']! as String,
    preparation: recipeMap['preparation']! as String,
    url: recipeMap['url']! as String
  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'ingredients': ingredients,
      'preparation': preparation,
      'url': url
    };
  }
}