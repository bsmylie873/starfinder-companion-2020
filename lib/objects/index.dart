//This object as a object the indexes inherit from.
class Index {
  //These parameters are common amongst indexes.
  String name;

  //This is the constructor for the Index object.
  Index({this.name});

  //This parses the json into the Weapon object.
  factory Index.fromJson(Map<String, dynamic> json) {
    return Index(
        name: json['Name']
    );
  }
}