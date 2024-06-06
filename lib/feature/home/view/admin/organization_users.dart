import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrganizationUsersView extends StatefulWidget {
  const OrganizationUsersView({super.key});

  @override
  State<OrganizationUsersView> createState() => _OrganizationUsersViewState();
}

class _OrganizationUsersViewState extends State<OrganizationUsersView> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Organization Users",
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
                            'Teachers',
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
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            'Students',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                        ),
                      ),
                    ],
                  )
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
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              organizationCard(
                                  name: "Utku Doğrusöz",
                                  mail: "utku.dogrusoz@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "İlayda Kaya",
                                  mail: "ilayda.kaya@stu.khas.edu.tr"),
                              organizationCard(
                                  name: "Mariya Aygül",
                                  mail: "mariya.aygul@stu.khas.edu.tr"),
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
