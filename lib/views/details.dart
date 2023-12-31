import 'package:blogapp/constants/constants.dart';
import 'package:blogapp/controller/post_controller.dart';
import 'package:blogapp/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.posts});

  @override
  State<PostDetail> createState() => _PostDetailState();

  final PostModel posts;
}

class _PostDetailState extends State<PostDetail> {
  final PostController _postController = Get.put(PostController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _postController.getComments(widget.posts.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.posts.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('$postImageurl${widget.posts.image}'),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  widget.posts.title,
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.posts.body,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Posted at   ${widget.posts.createdAt.toIso8601String()}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text('Comment'),
          Obx(() {
            return _postController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _postController.comments.value.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(_postController.comments.value[index].comment),
                        subtitle: Text(_postController.comments.value[index].name),
                        trailing: Text(_postController.comments.value[index].email),
                      );
                    }),
                  );
          })
        ],
      ),
    );
  }
}
