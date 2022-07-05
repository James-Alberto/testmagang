import 'dart:convert';
import 'userprofile.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<UserProfile>> getAllData() async {
    final response = await http.get(Uri.parse(
        'https://62c29218876c4700f527af65.mockapi.io/api/v1/test/testAPI'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => UserProfile.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future postData(
      // String firstname,
      // String lastname,
      // int loyaltypoints,
      // int fitnessgoal,
      // bool isactive,
      UserProfile user) async {
    final response = await http.post(
      Uri.parse(
        'https://62c29218876c4700f527af65.mockapi.io/api/v1/test/testAPI',
      ),
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: user.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to push Data');
    }
  }

  // Future<cData> getSingleData(String id) async {
  //   final response = await http.get(Uri.parse(
  //       'https://6283762138279cef71d77f41.mockapi.io/api/v1/data2/$id'));
  //   if (response.statusCode == 200) {
  //     return cData.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to get data');
  //   }
  // }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(Uri.parse(
        'https://62c29218876c4700f527af65.mockapi.io/api/v1/test/testAPI/$id'));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
