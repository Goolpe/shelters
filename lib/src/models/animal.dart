class Animal{
  Animal({
    this.id,
    this.userID,
    this.name,
    this.gender,
    this.genus,
    this.age,
    this.breed,
    this.color,
    this.height,
    this.weight,
    this.comment,
    this.images
  });

  int id;
  int userID;
  String name;
  String gender;
  String genus;
  DateTime age;
  String breed;
  String color;
  int height;
  int weight;
  String comment;
  List<dynamic> images;

  Animal.fromJson(dynamic json)
    : id = json['id'] as int,
    userID = json['userID'] as int,
    name = json['name'] as String,
    gender = json['gender'] as String,
    genus = json['genus'] as String,
    age = json['age'] != null ? DateTime.parse(json['age']) : null,
    breed = json['breed'] as String,
    color = json['color'] as String,
    height = json['height'] as int,
    weight = json['weight'] as int,
    comment = json['comment'] as String,
    images = json['images'] as List<dynamic>;
}