class User{
  User({
    this.id,
    this.name,
    this.images,
    this.favorites,
  });

  int id;
  String name;
  List<String> images;
  List<int> favorites;
}