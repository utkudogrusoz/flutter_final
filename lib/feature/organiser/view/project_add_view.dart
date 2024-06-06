import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_us_for_all/feature/organiser/viewmodel/project_view_model.dart';

class ProjectAddView extends ConsumerStatefulWidget {
  const ProjectAddView({super.key});

  @override
  _ProjectAddViewState createState() => _ProjectAddViewState();
}

class _ProjectAddViewState extends ConsumerState<ProjectAddView> {
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectCodeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedTeacher;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(projectViewModelProvider.notifier).fetchTeachers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final teachers = ref.watch(projectViewModelProvider);

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
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        'Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text(
                        'Teachers',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          'Students',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                          ),
                        ),
                      ),
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Project",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 250.0, right: 250.0, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(72.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Project Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                controller: _projectNameController,
                                hintText: "Project Name",
                                isTrue: false),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Project Code',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                controller: _projectCodeController,
                                hintText: "Project Code",
                                isTrue: false),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                controller: _descriptionController,
                                hintText: "Description",
                                isTrue: false),
                          )
                        ],
                      ),
                      Container(
                        height: 1500,
                        width: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Select Teacher',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: DropdownButtonFormField<String>(
                              items: teachers.map((teacher) {
                                return DropdownMenuItem<String>(
                                  value: teacher['id'].toString(),
                                  child: Text(teacher['firstName'] +
                                      " " +
                                      teacher['lastName']),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedTeacher = value;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                hintText: "Select Teacher",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(height: 40),
                          InkWell(
                            onTap: () async {
                              final projectData = {
                                "title": _projectNameController.text,
                                "description": _descriptionController.text,
                                "teacherId": int.parse(_selectedTeacher!),
                                "code": _projectCodeController.text
                              };
                              await ref
                                  .read(projectViewModelProvider.notifier)
                                  .addProject(projectData);
                             /* showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Project Information",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Project Name: ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              _projectNameController.text,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Description: ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              _descriptionController.text,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Teacher: ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              teachers.firstWhere((teacher) =>
                                                  teacher['id'].toString() ==
                                                  _selectedTeacher)['name'],
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        style: ButtonStyle(
                                          textStyle: MaterialStatePropertyAll(
                                            TextStyle(color: Colors.blueGrey),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close',
                                            style: TextStyle(
                                                color: Colors.blueGrey)),
                                      ),
                                    ],
                                  );
                                },
                              );*/
                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: const BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Text(
                                'Add Project',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  TextField mailTextField(
      {required TextEditingController controller,
      required String hintText,
      required bool isTrue}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isTrue ? Icon(Icons.arrow_downward) : null,
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
