class UserModel {
  UserModel({this.name, this.points, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    points = json['points'];
    id = json['id'];
  }

  String name;
  int points;
  String id;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['name'] = name;
    data['points'] = points;
    data['id'] = id;
    return data;
  }
}
