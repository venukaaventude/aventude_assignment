class Comments {
  int? id;
  int? postId;
  String? name;
  String? email;
  String? body;

  Comments({this.id, this.postId, this.name, this.email, this.body});

  Comments.initial()
      : id = 0,
        postId = 0,
        name = '',
        email = '',
        body = '';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['postId'] = postId;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
