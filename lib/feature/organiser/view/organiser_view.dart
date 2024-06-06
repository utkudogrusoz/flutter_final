import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_us_for_all/feature/organiser/viewmodel/organization_view_model.dart';

class OrganiserView extends ConsumerStatefulWidget {
  const OrganiserView({super.key});

  @override
  _OrganiserViewState createState() => _OrganiserViewState();
}

class _OrganiserViewState extends ConsumerState<OrganiserView> {
  String pageStatus = 'project';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(projectsProvider.notifier).fetchProjects();
      ref.read(teachersProvider.notifier).fetchTeachers();
      ref.read(studentsProvider.notifier).fetchStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectsProvider);
    final teachers = ref.watch(teachersProvider);
    final students = ref.watch(studentsProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                height: 150,
                width: 150,
                image: NetworkImage(
                    "https://www.khas.edu.tr/wp-content/uploads/2022/02/khas-logo-test.png"),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageStatus = 'project';
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          color: pageStatus == 'project'
                              ? Colors.blueGrey
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        'Projects',
                        style: TextStyle(
                          color: pageStatus == 'project'
                              ? Colors.white
                              : Colors.blueGrey,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageStatus = 'teacher';
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          color: pageStatus == 'teacher'
                              ? Colors.blueGrey
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        'Teachers',
                        style: TextStyle(
                          color: pageStatus == 'teacher'
                              ? Colors.white
                              : Colors.blueGrey,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageStatus = 'student';
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          color: pageStatus == 'student'
                              ? Colors.blueGrey
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        'Students',
                        style: TextStyle(
                          color: pageStatus == 'student'
                              ? Colors.white
                              : Colors.blueGrey,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Utku Doğrusöz",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Organiser",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: pageStatus == 'project'
          ? projectBody(projects: projects)
          : pageStatus == 'student'
              ? studentBody(users: students)
              : teacherBody(users: teachers),
    );
  }

  Column projectBody({List<Map<String, dynamic>>? projects}) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        //  context.go('/addOrganization');
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Text(
                          'Add Project',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < projects!.length; i += 3)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            organizationCard(
                              name: projects[i]['projectTitle'],
                              mail: projects[i]['userEmail'],
                            ),
                            if (i + 1 < projects.length)
                              organizationCard(
                                name: projects[i + 1]['projectTitle'],
                                mail: projects[i + 1]['userEmail'],
                              ),
                            if (i + 2 < projects.length)
                              organizationCard(
                                name: projects[i + 2]['projectTitle'],
                                mail: projects[i + 2]['userEmail'],
                              ),
                            if (i + 1 >= projects.length)
                              Expanded(child: Container()), // Boş alan için
                            if (i + 2 >= projects.length)
                              Expanded(child: Container()), // Boş alan için
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column studentBody({List<Map<String, dynamic>>? users}) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Students",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Text(
                          'Add Student',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    for (int i = 0; i < users!.length; i += 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          organizationCard(
                            name: users[i]['firstName']+users[i]['lastName'],
                            mail: users[i]['mail'],
                          ),
                          if (i + 1 < users.length)
                            organizationCard(
                              name: users[i + 1]['firstName']+users[i+1]['lastName'],
                              mail: users[i + 1]['mail'],
                            ),
                          if (i + 2 < users.length)
                            organizationCard(
                              name: users[i + 2]['firstName']+users[i+2]['lastName'],
                              mail: users[i + 2]['mail'],
                            ),
                          if (i + 1 >= users.length)
                            Expanded(child: Container()), // Boş alan için
                          if (i + 2 >= users.length)
                            Expanded(child: Container()), // Boş alan için
                        ],
                      ),
                  ],
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column teacherBody({List<Map<String, dynamic>>? users}) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Teachers",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Text(
                          'Add Teacher',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    for (int i = 0; i < users!.length; i += 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          organizationCard(
                            name: users[i]['firstName']+users[i]['lastName'],
                            mail: users[i]['mail'],
                          ),
                          if (i + 1 < users.length)
                            organizationCard(
                              name: users[i + 1]['firstName']+users[i+1]['lastName'],
                              mail: users[i + 1]['mail'],
                            ),
                          if (i + 2 < users.length)
                            organizationCard(
                              name: users[i + 2]['firstName']+users[i+2]['lastName'],
                              mail: users[i + 2]['mail'],
                            ),
                          if (i + 1 >= users.length)
                            Expanded(child: Container()), // Boş alan için
                          if (i + 2 >= users.length)
                            Expanded(child: Container()), // Boş alan için
                        ],
                      ),
                  ],
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding organizationCard({@required String? name, @required String? mail}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        height: 100,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name!,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        mail!,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onHover: (value) {},
                    onTap: () {
                      //   context.go("/organizationUsers");
                    },
                    child: Container(
                      height: 20,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade900,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Center(
                          child: Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
