import 'package:practice_post_api/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingServices {
  Future<Post> addUserData(
      String email, String firstName, String avatarUrl) async {
    try {
      var url = Uri.parse('https://reqres.in/api/users');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'first_name': firstName,
          'avatar': avatarUrl,
        }),
      );

      if (response.statusCode == 201) {
        print(email);
        print(firstName);

        print(avatarUrl);
        print('User data added successfully');
      } else {
        print('Failed to add user data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to add user data: $error');
    }
    return throw "Unable to update";
  }

//Get Method

  Future<Post> getPostData() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://reqres.in/api/users"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print("Data : ${data.toString()}");
        print(Post.fromJson(data));
        return Post.fromJson(data);
      } else {
        throw Exception('Unable to load Data');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to fetch data: $error');
    }
  }
}
// // try {
//       http.Response response =
//           await http.get(Uri.parse('https://fakestoreapi.com/products'));
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body) as List;
//         List<Product> productData =
//             data.map((json) => Product.fromJson(json)).toList();
//         print(productData.first.id);
//         return productData;
//       } else {
//         throw Exception(' Failed to load Data');
//       }
//     } catch (err) {
//       print(err);
//     }
