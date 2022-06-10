import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network/data/post.dart';

// chua toan bo function giao tiep voi server cho Post data
class PostService {
  Future<List<Post>> fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final data = response.body;

    final result = <Post>[];
    if (response.statusCode == 200) {
      final postList = jsonDecode(data);
      for (var postJson in postList) {
        final post = Post.fromJson(postJson);
        result.add(post);
      }
    }
    return result;
  }

  Future<bool> createPost(Post post) async {
    print('hoan.dv: createPost');
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        post.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  Future<Post?> getPostById({id}) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    final data = response.body;

    if (response.statusCode == 200) {
      final postJson = jsonDecode(data);
      return Post.fromJson(postJson);
    }

    return null;
  }
}
