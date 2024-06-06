import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/service/organization_service.dart';

final organizationServiceProvider = Provider((ref) => OrganizationService('http://192.168.1.8:8080'));

final organizationViewModelProvider = StateNotifierProvider<OrganizationViewModel, List<Map<String, dynamic>>>((ref) {
  final organizationService = ref.watch(organizationServiceProvider);
  return OrganizationViewModel(organizationService);
});

class OrganizationViewModel extends StateNotifier<List<Map<String, dynamic>>> {
  final OrganizationService _organizationService;

  OrganizationViewModel(this._organizationService) : super([]);

  Future<void> fetchProjects() async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      final projects = await _organizationService.getProjects(accessToken: accessToken);
      state = projects;
    } catch (error) {
      state = [];
      print('Failed to load projects: $error');
    }
  }
}
