enum UserStatus { uninitialized, authenticated, unauthenticated }

class User {
  String? name;
  String? email;
  String? password;
  UserStatus? status;

  User({this.email, this.password});

  User.initial()
      : name = '',
        email = '',
        status = UserStatus.uninitialized;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}
