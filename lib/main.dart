import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_us_for_all/feature/admin/view/admin_view.dart';
import 'package:open_us_for_all/feature/auth/view/login_view.dart';
import 'package:open_us_for_all/feature/auth/viewmodel/auth_view_model.dart';
import 'package:open_us_for_all/feature/home/view/admin/organization_add_view.dart';
import 'package:open_us_for_all/feature/home/view/admin/organization_users.dart';
import 'package:open_us_for_all/feature/home/view/home_view.dart';
import 'package:open_us_for_all/feature/organiser/view/organiser_view.dart';
import 'package:open_us_for_all/feature/home/view/organiser/project_add_view.dart';
import 'package:open_us_for_all/feature/home/view/organiser/teacher_add_view.dart';
import 'package:open_us_for_all/feature/home/view/organiser/teacher_list_view.dart';
import 'package:open_us_for_all/feature/home/view/student/student_project_detail.dart';
import 'package:open_us_for_all/feature/home/view/teacher/project_detail_view.dart';
import 'package:open_us_for_all/feature/home/view/teacher/teacher_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   /* final authState = ref.watch(authViewModel);

    final GoRouter _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) => AdminView(),
        ),
        GoRoute(
          path: '/addOrganization',
          builder: (context, state) => OrganizationAddView(),
        ),
        GoRoute(
          path: '/organizationUsers',
          builder: (context, state) => OrganizationUsersView(),
        ),
        GoRoute(
          path: '/organiser',
          builder: (context, state) => OrganiserView(),
        ),
        GoRoute(
          path: '/teacherList',
          builder: (context, state) => TeacherListView(),
        ),
        GoRoute(
          path: '/teacherList',
          builder: (context, state) => TeacherListView(),
        ),
        GoRoute(
          path: '/teacherAdd',
          builder: (context, state) => TeacherAddView(),
        ),
      ],
      errorBuilder: (context, state) => LoginView(), // Ek hata yönetimi
    ); */

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: FutureBuilder<int?>(
        future: getRoleId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('An error occurred: ${snapshot.error}')),
            );
          } else {
            switch (snapshot.data) {
              case 1:
                return OrganiserView();
              default:
                return LoginView();
            }
          }
        },
      ),
    );
  }
    Future<int?> getRoleId() async {
    final box = Hive.box('authBox');
    return box.get('roleId');
  }
}
