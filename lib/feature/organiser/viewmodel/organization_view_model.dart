import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/service/organization_service.dart';

final organizationServiceProvider =
    Provider((ref) => OrganizationService('http://192.168.1.8:8080'));

final projectsProvider =
    StateNotifierProvider<ProjectsViewModel, List<Map<String, dynamic>>>((ref) {
  final organizationService = ref.watch(organizationServiceProvider);
  return ProjectsViewModel(organizationService);
});

final studentsProvider =
    StateNotifierProvider<StudentsViewModel, List<Map<String, dynamic>>>((ref) {
  final organizationService = ref.watch(organizationServiceProvider);
  return StudentsViewModel(organizationService);
});

final teachersProvider =
    StateNotifierProvider<TeachersViewModel, List<Map<String, dynamic>>>((ref) {
  final organizationService = ref.watch(organizationServiceProvider);
  return TeachersViewModel(organizationService);
});

class ProjectsViewModel extends StateNotifier<List<Map<String, dynamic>>> {
  final OrganizationService _organizationService;

  ProjectsViewModel(this._organizationService) : super([]);

  Future<void> fetchProjects() async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      final projects =
          await _organizationService.getProjects(accessToken: accessToken);
      state = projects;
      print("Projects fetched: ${projects.length}");
      print("Projects data: $projects");
    } catch (error) {
      print('Failed to load projects: $error');
    }
  }
}

class StudentsViewModel extends StateNotifier<List<Map<String, dynamic>>> {
  final OrganizationService _organizationService;

  StudentsViewModel(this._organizationService) : super([]);

  Future<void> fetchStudents() async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      final students = await _organizationService.getStudents(
          accessToken: accessToken);
      state = students;
      print("Students fetched: ${students.length}");
      print("Students data: $students");
    } catch (error) {
      print('Failed to load students: $error');
    }
  }
}

class TeachersViewModel extends StateNotifier<List<Map<String, dynamic>>> {
  final OrganizationService _organizationService;

  TeachersViewModel(this._organizationService) : super([]);

  Future<void> fetchTeachers() async {
    try {
      final box = await Hive.openBox('authBox');
      final accessToken = box.get('accessToken');
      final teachers = await _organizationService.getUsers(
          accessToken: accessToken, roleId: 2);
      state = teachers;
      print("Teachers fetched: ${teachers.length}");
      print("Teachers data: $teachers");
    } catch (error) {
      print('Failed to load TEACHER: $error');
    }
  }
}
