import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/service/admin_service.dart';

final adminServiceProvider = Provider((ref) => AdminService('http://192.168.1.8:8080'));

final adminViewModelProvider = StateNotifierProvider<AdminViewModel, List<dynamic>>((ref) {
  final adminService = ref.watch(adminServiceProvider);
  return AdminViewModel(adminService);
});

class AdminViewModel extends StateNotifier<List<dynamic>> {
  final AdminService _adminService;

  AdminViewModel(this._adminService) : super([]);

  Future<void> fetchOrganizations() async {
    try {
      final box = Hive.box('authBox');
    final accessToken = box.get('accessToken');
      final organizations = await _adminService.getOrganizationList(accessToken:accessToken);
      state = organizations;
    } catch (error) {
      print('Failed to load organizations: $error');
    }
  }
  
}
