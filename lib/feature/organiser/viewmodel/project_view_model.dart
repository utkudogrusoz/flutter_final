import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/service/organization_service.dart';

final projectServiceProvider = Provider((ref) => OrganizationService('http://192.168.1.8:8080'));

final projectViewModelProvider = StateNotifierProvider<ProjectViewModel, List<Map<String, dynamic>>>((ref) {
  final projectService = ref.watch(projectServiceProvider);
  return ProjectViewModel(projectService);
});

class ProjectViewModel extends StateNotifier<List<Map<String, dynamic>>> {
  final OrganizationService _organizationService;

  ProjectViewModel(this._organizationService) : super([]);

  Future<void> fetchTeachers() async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      final teachers = await _organizationService.getUsers(accessToken: accessToken, roleId: 2);
      state = teachers;
      print("Teachers fetched: ${teachers.length}");
      print("Teachers data: $teachers");
    } catch (error) {
      print('Failed to load teachers: $error');
    }
  }

  Future<void> addProject(Map<String, dynamic> projectData) async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      await _organizationService.addProject(projectData: projectData, accessToken: accessToken);
      print("Project added successfully");
    } catch (error) {
      print('Failed to add project: $error');
    }
  }
}
