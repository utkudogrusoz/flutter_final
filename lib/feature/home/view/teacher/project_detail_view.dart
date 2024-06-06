import 'package:flutter/material.dart';

class ProjectDetailView extends StatefulWidget {
  const ProjectDetailView({super.key});

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  int status = 0;
  String? _selectedValue;

  final List<String> _dropdownValues = [
    'Gamification',
    'Storyboards',
    'Protocols',
    'Technological Activities',
    'Practical workshops',
    'Information search',
    'Fake News',
    'Conceptual maps',
    'Webinars',
    'Multilingual presentations',
    'Technological Activities',
    'Virtual laboratories',
    'Presentations with digital support',
  ];

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
                    "İlayda Kaya",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Teacher",
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
                    "Fill Projects",
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
                          setState(() {
                            status = 0;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: status == 0
                                  ? Colors.blueAccent
                                  : Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            'Project Content',
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
                          setState(() {
                            status = 1;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: status == 1
                                  ? Colors.blueAccent
                                  : Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            'Select Students',
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
          status == 1 ? studentAddWidget() : projectAddWidget(),
        ],
      ),
    );
  }

  Expanded studentAddWidget() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: false,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: true,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: true,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: true,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: true,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: false,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: true,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: false,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: false,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      organizationCard(
                          isTrue: false,
                          name: "Utku Doğrusöz",
                          mail: "utku.dogrusoz@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "İlayda Kaya",
                          mail: "ilayda.kaya@stu.khas.edu.tr"),
                      organizationCard(
                          isTrue: false,
                          name: "Mariya Aygül",
                          mail: "mariya.aygul@stu.khas.edu.tr"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded projectAddWidget() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.shade700,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Phase 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Phase 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Phase 3",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Phase 4",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: 1000,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1000,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 300,
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey.shade300,
                                underline: Container(),
                                isExpanded: true,
                                icon: Icon(Icons.arrow_downward),
                                hint: Text('Select an activity'),
                                value: _selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedValue = newValue;
                                  });
                                },
                                items: _dropdownValues.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 400,
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 1000,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "1- Problem resolution",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "2- Questionnaires",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "3- 3d design",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 280,),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    status = 0;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: status == 0
                                          ? Colors.blueAccent
                                          : Colors.blueGrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Center(
                                      child: Text(
                                    'Move to Phase 3',
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
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  Padding organizationCard(
      {@required String? name,
      @required String? mail,
      @required bool? isTrue}) {
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
                  Checkbox(
                      activeColor: Colors.blueGrey,
                      value: isTrue,
                      onChanged: (value) {
                        setState(() {
                          isTrue = value;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField mailTextField(
      {@required String? hintText, @required bool? isTrue}) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: isTrue! ? Icon(Icons.arrow_downward) : null,
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        //  prefixIcon: Icon(Icons.email, color: Colors.grey),
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
