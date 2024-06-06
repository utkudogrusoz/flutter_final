import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminService {
  final String baseUrl;

  AdminService(this.baseUrl);

  Future<List<dynamic>> getOrganizationList(
      {@required String? accessToken}) async {
    final url = Uri.parse('$baseUrl/organization/getOrganizationList');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);
      return jsonDecode(decodedData);
    } else {
      throw Exception('Failed to load organizations');
    }
  }


 Future<Map<String, dynamic>> addOrganization({Map<String, String>? organizationData, String? accessToken}) async {
    final url = Uri.parse('$baseUrl/organization/createOrganization');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(organizationData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add organization');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
