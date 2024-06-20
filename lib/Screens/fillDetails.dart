import 'dart:io';

import 'package:core_flutter_exam/Screens/global.dart';
import 'package:core_flutter_exam/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Filldetails extends StatefulWidget {
  const Filldetails({super.key});

  @override
  State<Filldetails> createState() => _FilldetailsState();
}

class _FilldetailsState extends State<Filldetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: barColor),
          centerTitle: true,
          backgroundColor: barColor,
          title: Text(
            'Fill Information',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          toolbarHeight: 65,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        XFile? xFileImage =
                                            await imgPicker.pickImage(
                                                source: ImageSource.gallery);
                                        fileImage = File(xFileImage!.path);
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Gallery',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        XFile? xFileImage =
                                            await imgPicker.pickImage(
                                                source: ImageSource.camera);
                                        fileImage = File(xFileImage!.path);
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Camera',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20),
                                      )),
                                ],
                              ),
                            );
                          });
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          (fileImage != null) ? FileImage(fileImage!) : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  //todo ---------------------> name
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                    },
                    controller: txtName,
                    decoration: InputDecoration(
                      label: Text('Student Name',style: TextStyle(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  //todo --------------------> GRID
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                    },
                    controller: txtGrId,
                    decoration: InputDecoration(
                      label: Text('GR ID',style: TextStyle(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          )),
                    ),
                  ),
                  SizedBox(height: 15),
                  //todo ------------------> Standered
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                    },
                    controller: txtStd,
                    decoration: InputDecoration(
                      label: Text('Standard',style: TextStyle(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() && fileImage != null) {
                          Navigator.of(context).pushNamed('/');
                          studentList.add(StudentModel(
                            name: txtName.text,
                            grid: txtGrId.text,
                            std: txtStd.text,
                            file: fileImage,
                          ));
                        }
                        if(fileImage == null){
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Photo is Required!')));
                          });
                        }
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.blue, fontSize: 22),
                      ),
                    ),
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
