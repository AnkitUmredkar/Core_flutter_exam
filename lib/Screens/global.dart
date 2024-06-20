import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Color barColor = Color(0xff0174EB);
Color bgColor = Color(0xff191A1F);
TextEditingController txtName = TextEditingController();
TextEditingController txtGrId = TextEditingController();
TextEditingController txtStd = TextEditingController();
File? fileImage;
GlobalKey<FormState> formKey = GlobalKey();
List studentList = [];

ImagePicker imgPicker = ImagePicker();
