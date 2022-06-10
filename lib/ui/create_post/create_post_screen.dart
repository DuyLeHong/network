import 'package:flutter/material.dart';
import 'package:network/data/post.dart';
import 'package:network/data/post_service.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  final _userIdController = TextEditingController();
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _idController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _titleController,
          ),
          TextField(
            controller: _bodyController,
          ),
          const SizedBox(
            height: 100,
          ),
          TextButton(
            onPressed: () async {
              final post = Post(
                userId: int.parse(
                  _userIdController.text,
                ),
                id: int.parse(
                  _idController.text,
                ),
                title: _titleController.text,
                body: _bodyController.text,
              );
              final postService = PostService();
              final result = await postService.createPost(post);

              print('hoan.dv: create a post to server with result $result');

              Navigator.pop(context, result);
            },
            child: const Text('Create Post'),
          )
        ],
      ),
    );
  }
}
