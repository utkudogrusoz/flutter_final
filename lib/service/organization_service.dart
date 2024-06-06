import 'package:http/http.dart' as http;
import 'dart:convert';

class OrganizationService {
  final String baseUrl;

  OrganizationService(this.baseUrl);

  Future<List<Map<String, dynamic>>> getProjects({required String accessToken}) async {
    final url = Uri.parse('$baseUrl/project/getAllProjectsByOrganization');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);
      return List<Map<String, dynamic>>.from(jsonDecode(decodedData));
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
