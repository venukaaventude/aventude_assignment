import 'dart:convert';

import 'package:aventude_assignment/app/core/datamodels/album.dart';
import 'package:aventude_assignment/app/core/datamodels/comment.dart';
import 'package:aventude_assignment/app/core/datamodels/post.dart';
import 'package:aventude_assignment/app/core/datamodels/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static String _endpoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();
  DateTime now = DateTime.now();

  static String get endpoint => _endpoint;

  static initAPIEndPoint(SharedPreferences prefs) {
    try {
      String? serverApiEndpoint = prefs.getString("server_api_endpoint");
      if (serverApiEndpoint == null) {
        if (kDebugMode) {
          print(">>>>> GET server_api_endpoint returned NULL! <<<<<");
        }
      } else {
        _endpoint = serverApiEndpoint;
      }
    } catch (e) {
      if (kDebugMode) {
        print(">>>>> ERR: GET server_api_endpoint: $e");
      }
    }
    if (kDebugMode) {
      print('>>>>>> Init-Server Endpoint $_endpoint');
    }
  }

  Future<User?> login(String email, String password) async {
    String body = '"Username":"$email","Password":"$password"';
    return await loginProcess();
  }

  Future<User?> loginProcess() async {
    return null;
  }

  Future<List<Post>> getPostData() async {
    String _url = '$_endpoint/posts';
    var response = await client.get(
      Uri.parse(_url),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      List dataItems = json.decode(response.body);

      return dataItems.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<Album>> getAlbumData() async {
    String _url = '$_endpoint/albums';
    var response = await client.get(
      Uri.parse(_url),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      List dataItems = json.decode(response.body);

      return dataItems.map((e) => Album.fromJson(e)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<Comments>> getCommentsData(int id) async {
    String _url = '$_endpoint/comments?postId=$id';
    var response = await client.get(
      Uri.parse(_url),
    );

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      List dataItems = json.decode(response.body);

      return dataItems.map((e) => Comments.fromJson(e)).toList();
    } else {
      throw Exception(response.body);
    }
  }
}
