import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrganiserView extends StatefulWidget {
  const OrganiserView({super.key});

  @override
  State<OrganiserView> createState() => _OrganiserViewState();
}

class _OrganiserViewState extends State<OrganiserView> {
  @override
  Widget build(BuildContext context) {
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
                      //  context.go('/addOrganization');
                    },
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                        context.go('/teacherList');
                    },
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
                  SizedBox(
                    width: 10,
                  ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project1",
                                  mail: "CE101"),
                              organizationCard(
                                  name: "Project2",
                                  mail: "CE102"),
                              organizationCard(
                                  name: "Project3",
                                  mail: "CE103"),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project4",
                                  mail: "CE201"),
                              organizationCard(
                                  name: "Project5",
                                  mail: "CE202"),
                              organizationCard(
                                  name: "Project6",
                                  mail: "CE203"),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project7",
                                  mail: "CE301"),
                              organizationCard(
                                  name: "Project8",
                                  mail: "CE302"),
                              organizationCard(
                                  name: "Project9",
                                  mail: "CE303"),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project10",
                                  mail: "CE401"),
                              organizationCard(
                                  name: "Project11",
                                  mail: "CE402"),
                              organizationCard(
                                  name: "Project12",
                                  mail: "CE403"),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project13",
                                  mail: "CE111"),
                              organizationCard(
                                  name: "Project14",
                                  mail: "CE112"),
                              organizationCard(
                                  name: "Project15",
                                  mail: "CE113"),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project16",
                                  mail: "CE114"),
                              organizationCard(
                                  name: "Project17",
                                  mail: "CE115"),
                              organizationCard(
                                  name: "Project18",
                                  mail: "CE116"),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Project19",
                                  mail: "CE117"),
                              organizationCard(
                                  name: "Project20",
                                  mail: "CE118"),
                              organizationCard(
                                  name: "Project21",
                                  mail: "CE119"),
                            ],
                          ),
                         
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
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
