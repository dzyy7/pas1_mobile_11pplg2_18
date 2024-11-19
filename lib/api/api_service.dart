// services/register_service.dart
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_18/Models/api_model.dart';
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://thesportsdb.com/api/v1/json/3';

  Future<List<ApiModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List data = jsonResponse['teams'];
      return data.map((json) => ApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}