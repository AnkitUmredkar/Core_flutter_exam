import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'global.dart';
import 'homepage.dart';

class showData extends StatefulWidget {
  const showData({super.key});

  @override
  State<showData> createState() => _showDataState();
}

class _showDataState extends State<showData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: barColor,
          title: Text(
            'Students Details',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          toolbarHeight: 65,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      radius: 74,
                      backgroundImage:
                          (fileImage != null) ? FileImage(fileImage!) : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //todo ---------------------> name
                  Text(
                    'Student Name : ${txtName.text}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  //todo --------------------> GRID
                  Text(
                    'Student GRID : ${txtGrId.text}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  //todo ------------------> Standered
                  Text(
                    'Student Standard : ${txtStd.text}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
