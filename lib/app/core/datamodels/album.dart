class Album {
  int? id;
  int? userId;
  String? title;

  Album({this.id, this.userId, this.title});

  Album.initial()
      : id = 0,
        userId = 0,
        title = '';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    return data;
  }

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
  }
}
