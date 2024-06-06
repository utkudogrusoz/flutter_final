import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_us_for_all/feature/admin/viewmodel/organization_add_view_model.dart';

class OrganizationAddView extends ConsumerStatefulWidget {
  const OrganizationAddView({super.key});

  @override
  _OrganizationAddViewState createState() => _OrganizationAddViewState();
}

class _OrganizationAddViewState extends ConsumerState<OrganizationAddView> {
  final _formKey = GlobalKey<FormState>();
  final _organizationNameController = TextEditingController();
  final _mailPathController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final organizationAddViewModel =
        ref.watch(organizationAddViewModelProvider);

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
              Column(
                children: [
                  Text(
                    "Taner Arsan",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Admin",
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add Organization",
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
                            'First Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                hintText: "First Name",
                                controller: _firstNameController),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Last Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                hintText: "Last Name",
                                controller: _lastNameController),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                hintText: "Password",
                                controller: _passwordController,
                                obscureText: true),
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
                            'Organization Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                hintText: "Organization Name",
                                controller: _organizationNameController),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Organization Mail Path',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: mailTextField(
                                hintText: "example.edu",
                                controller: _mailPathController),
                          ),
                          SizedBox(height: 40),
                          InkWell(
                            onTap: () async {
                              final organizationData = {
                                'organizationName':
                                    _organizationNameController.text,
                                'mailPath': _mailPathController.text,
                                'firstName': _firstNameController.text,
                                'lastName': _lastNameController.text,
                                'password': _passwordController.text,
                              };

                              await ref
                                  .read(
                                      organizationAddViewModelProvider.notifier)
                                  .addOrganization(organizationData);

                              final response =
                                  ref.read(organizationAddViewModelProvider);
                              if (response.containsKey('error') ||
                                  response['mailPath'] == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Failed to add organization')));
                              } else {
                                showDialog(
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
                                                "Organization Information",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Organization Name: ",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                response['organizationName'],
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "User Name: ",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                "${response['firstName']} ${response['lastName']}",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Mail: ",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                response['mailPath'],
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Password: ",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                response['password'],
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
                                );
                              }
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
                                'Add Organization',
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
      {@required String? hintText,
      required TextEditingController controller,
      bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
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
