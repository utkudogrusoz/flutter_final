import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/service/organization_service.dart';

final userServiceProvider = Provider((ref) => OrganizationService('http://192.168.1.8:8080'));

final userViewModelProvider = StateNotifierProvider<UserViewModel, List<Map<String, dynamic>>>((ref) {
  final userService = ref.watch(userServiceProvider);
  return UserViewModel(userService);
});

class UserViewModel extends StateNotifier<List<Map<String, dynamic>>> {
  final OrganizationService _organizationService;

  UserViewModel(this._organizationService) : super([]);

  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      await _organizationService.addUser(userData: userData, accessToken: accessToken);
      print("User added successfully");
    } catch (error) {
      print('Failed to add user: $error');
    }
  }
}
