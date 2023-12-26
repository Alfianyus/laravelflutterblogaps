import 'package:blogapp/models/posts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  final isLoading = false.obs;

  Future getAllPosts() async {
    try {
      var response = await http.get(Uri.parse('${url}posts'), headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer ${box.read('token)}',
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
