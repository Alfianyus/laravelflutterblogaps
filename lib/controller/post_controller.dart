import 'package:blogapp/constants/constants.dart';
import 'package:blogapp/models/comments.dart';
import 'package:blogapp/models/posts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  Rx<List<CommentModel>> comments = Rx<List<CommentModel>>([]);
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllPosts();
    // TODO: implement onInit
    super.onInit();
  }

  Future getAllPosts() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}posts'), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['posts'];
        for (var item in content) {
          posts.value.add(PostModel.fromJson(item));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getComments(id) async {
    try {
      comments.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}post/comments/$id'), headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['comments'];
        print(content);
        for (var item in content) {
          comments.value.add(CommentModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
