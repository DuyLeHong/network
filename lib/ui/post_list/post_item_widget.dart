import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/data/post.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    Key? key,
    required this.post,
    this.onPostItemClicked,
  }) : super(key: key);

  final Post post;
  final Function(int)? onPostItemClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPostItemClicked?.call(post.id);
      },
      child: Column(
        children: [
          Text('User Id: ${post.userId}'),
          Text('Id: ${post.id}'),
          Text('Title: ${post.title}'),
          Text('Body: ${post.body}'),
          Divider(),
        ],
      ),
    );
  }
}
