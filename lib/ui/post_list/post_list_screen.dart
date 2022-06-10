import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/data/post_service.dart';
import 'package:network/ui/create_post/create_post_screen.dart';
import 'package:network/ui/post_detail/post_detail_screen.dart';
import 'package:network/ui/post_list/post_item_widget.dart';

import '../../data/post.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostListState();
}

class _PostListState extends State<PostListScreen> {
  final _postData = <Post>[];
  final postService = PostService();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final postList = await postService.fetchPost();
      _postData.clear();
      _postData.addAll(postList);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hoan.dv: build post list screen');

    return Scaffold(
      body: ListView.builder(
        itemCount: _postData.length,
        itemBuilder: (_, index) {
          final post = _postData[index];
          return PostItemWidget(
            post: post,
            onPostItemClicked: (id) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PostDetailScreen(id: id);
              }));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return CreatePostScreen();
              },
            ),
          );

          if (result) {
            final postList = await postService.fetchPost();
            _postData.clear();
            _postData.addAll(postList);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
