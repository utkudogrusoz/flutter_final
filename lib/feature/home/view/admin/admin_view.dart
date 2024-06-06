import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  bool buttonIsHover = false;
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
                    "Organizations",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go('/addOrganization');
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text(
                        'Add Organization',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView(
              children: [
                organizationCard(),
                organizationCard(),
                organizationCard(),
                organizationCard(),
                organizationCard(),
                organizationCard(),
                organizationCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding organizationCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300.0, vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://sgs.khas.edu.tr/sites/khas.edu.tr/files/inline-images/KhasLogo1.png"),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kadir Has Üniversitesi',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '@khas.edu.tr',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        buttonIsHover = !buttonIsHover;
                      });
                    },
                    onTap: () {
                      context.go("/organizationUsers");
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color:
                              buttonIsHover ? Colors.amber : Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        'Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        buttonIsHover = !buttonIsHover;
                      });
                    },
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: buttonIsHover
                              ? Colors.amber
                              : Colors.lightBlue.shade900,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
