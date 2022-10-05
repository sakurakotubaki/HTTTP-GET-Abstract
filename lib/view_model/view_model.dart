import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_class/repository/base_url.dart';
import '../model/model.dart';

class UrlOne implements BaseUrl {
  @override
  Future<Album> fetchAlbum() async {
    print('抽象クラスを継承したプログラム1を実行');
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class UrlTwo implements BaseUrl {
  @override
  Future<Album> fetchAlbum() async {
    print('抽象クラスを継承したプログラム2を実行');
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class UrlThree implements BaseUrl {
  @override
  Future<Album> fetchAlbum() async {
    print('抽象クラスを継承したプログラム3を実行');
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/3'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
