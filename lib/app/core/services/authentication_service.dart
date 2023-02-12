import 'dart:async';
import 'dart:convert';

import 'package:aventude_assignment/app/core/datamodels/album.dart';
import 'package:aventude_assignment/app/core/datamodels/comment.dart';
import 'package:aventude_assignment/app/core/datamodels/post.dart';
import 'package:aventude_assignment/app/core/datamodels/user.dart';
import 'package:aventude_assignment/app/core/services/api.dart';
import 'package:aventude_assignment/app/router/locator.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService extends ChangeNotifier {
  final Api _webClient = locator<Api>();
  final _userController = StreamController<User>();
  final _postController = StreamController<List<Post>>();
  final _albumController = StreamController<List<Album>>();
  final _commentController = StreamController<List<Comments>>();

  Stream<User> get user => _userController.stream;
  Stream<List<Post>> get post => _postController.stream;
  Stream<List<Album>> get album => _albumController.stream;
  Stream<List<Comments>> get comments => _commentController.stream;

  Future initial() async {
    User user = User.initial();
    List<Post> posts = [];
    List<Album> albums = [];
    List<Comments> comments = [];

    _userController.add(user);
    _postController.add(posts);
    _albumController.add(albums);
    _commentController.add(comments);
    notifyListeners();
  }

  Future<List<Post>> getPostData() async {
    List<Post> posts = await _webClient.getPostData();
    _postController.add(posts);
    return posts;
  }

  Future<List<Album>> getAlbumData() async {
    List<Album> albums = await _webClient.getAlbumData();
    _albumController.add(albums);
    return albums;
  }

  Future<List<Comments>> getCommentsData(int id) async {
    List<Comments> comments = await _webClient.getCommentsData(id);
    _commentController.add(comments);
    return comments;
  }
}
