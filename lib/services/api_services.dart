import 'dart:convert';

import 'package:api_load/model/post_model.dart';
import 'package:http/http.dart' as http;

// class RemoteService {
//   Future<List<PostData>> fetchData() async {
//     final response =
//         await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

//     // return jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body.toString());

//       return List<PostData>.fromJson(data);
//       // List<PostData>.fromJson
//       // return postDataFromJson(json.toString());
//     }
//     else{
//       throw Exception('Failed to load album');
//     }
//   }
// }

class RemoteService {
  Future<List<PostData>> fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body.toString());
      return jsonData.map((json) => PostData.fromJson(json)).toList();
    } else {
      throw Exception("Faile to fetch data");
    }
  }
}
