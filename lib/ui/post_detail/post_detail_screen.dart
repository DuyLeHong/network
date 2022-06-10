import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/post.dart';
import '../../data/post_service.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<StatefulWidget> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetailScreen> {
  Post? post;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final postService = PostService();
      post = await postService.getPostById(id: widget.id);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('User Id: ${post?.userId}'),
          Text('Id: ${post?.id}'),
          Text('Title: ${post?.title}'),
          Text('Body: ${post?.body}'),
        ],
      ),
    );
  }
}
