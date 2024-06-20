import 'dart:io';
import 'package:flutter/material.dart';
import 'global.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: barColor),
          centerTitle: true,
          backgroundColor: barColor,
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          toolbarHeight: 65,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: List.generate(
              studentList.length,
              (index) => Container(
                height: 100,
                padding: EdgeInsets.only(left: 6),
                margin: EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff35383F),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: (studentList[index].file != null)
                          ? FileImage(studentList[index].file!)
                          : null,
                    ),
                    Container(
                      width: 260,
                      child: GestureDetector(
                        onTap: () {
                          txtName.text = studentList[index].name;
                          txtGrId.text = studentList[index].grid;
                          txtStd.text = studentList[index].std;
                          fileImage = studentList[index].file;
                          Navigator.of(context).pushNamed('/showData');
                        },
                        child: ListTile(
                          title: Text(
                            studentList[index].name,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text(
                            studentList[index].grid,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                          trailing: Text(
                            studentList[index].std,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              txtName.text = studentList[index].name;
                              txtGrId.text = studentList[index].grid;
                              txtStd.text = studentList[index].std;
                              fileImage = studentList[index].file;
                              selectedIndex = index;
                              Navigator.of(context).pushNamed('/editPage');
                            },
                            child: Icon(Icons.edit, color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                studentList.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete, color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            txtName = TextEditingController();
            txtGrId = TextEditingController();
            txtStd = TextEditingController();
            fileImage = null;
            Navigator.of(context).pushNamed('/fillDetails');
          },
          backgroundColor: barColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

int selectedIndex = 0;

class StudentModel {
  String? name, grid, std;
  File? file;

  StudentModel({this.name, this.grid, this.std, this.file});
}
