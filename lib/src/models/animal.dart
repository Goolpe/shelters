class AnimalModel{
  final String name;
  final String url;
  final String age;
  final String breed;
  final String type;
  
  AnimalModel({
    this.name,
    this.url,
    this.age,
    this.breed,
    this.type
  });

  factory AnimalModel.fromJson(Map<dynamic, dynamic> _parsedJson){
    return AnimalModel(
      name: _parsedJson['name'],
      type: _parsedJson['type'],
      age: _parsedJson['age'],
      breed: _parsedJson['breed'],
      url: _parsedJson['url']
    );
  }
}

