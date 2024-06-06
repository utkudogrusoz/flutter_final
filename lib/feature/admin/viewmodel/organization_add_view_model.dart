import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/service/admin_service.dart';

final adminServiceProvider =
    Provider((ref) => AdminService('http://192.168.1.8:8080'));

final organizationAddViewModelProvider =
    StateNotifierProvider<OrganizationAddViewModel, Map<String, dynamic>>(
        (ref) {
  final adminService = ref.watch(adminServiceProvider);
  return OrganizationAddViewModel(adminService);
});

class OrganizationAddViewModel extends StateNotifier<Map<String, dynamic>> {
  final AdminService _adminService;

  OrganizationAddViewModel(this._adminService) : super({});

  Future<void> addOrganization(Map<String, String> organizationData) async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      final response = await _adminService.addOrganization(
          organizationData: organizationData, accessToken: accessToken);
      state = response;
    } catch (error) {
      state = {'error': error.toString()};
    }
  }
}
