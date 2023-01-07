import 'package:bloc_app/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PostsService {

  final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
  final List<Post> posts = [];


  Future<List<Post>> getPosts() async {
    final response = await http.get( url );

    final jsonResponse = jsonDecode(response.body) as List<dynamic>;

    for (final element in jsonResponse) {
      posts.add(Post.fromMap(element));
    }

    return posts;
  }
}