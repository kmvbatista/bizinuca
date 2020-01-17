class User {
  String name;
  int points;
  int id;

  User({this.name, this.points, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    points = json['points'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['points'] = this.points;
    data['id'] = this.id;
    return data;
  }
}
