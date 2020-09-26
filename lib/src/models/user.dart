class User{
  User({
    this.id,
    this.name,
    this.images,
    this.favorites,
    this.companyID,
  });

  int id;
  String name;
  List<dynamic> images;
  List<dynamic> favorites;
  int companyID;

  User.fromJson(dynamic json)
    : id = json['id'] as int,
    name = json['name'] as String,
    images = json['images'] as List<dynamic>,
    favorites = json['favorites'] as List<dynamic>,
    companyID = json['companyID'] as int;
}
