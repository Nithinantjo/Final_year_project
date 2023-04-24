class UserModel {
  late String? name;
  late String? email;
  late String? pass;

  UserModel({
    this.name, this.email, this.pass
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    pass = json["pass"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic> {};

    _data["name"] = name;
    _data["email"] = email;
    _data["password"] = pass;

    return _data;
  }
}