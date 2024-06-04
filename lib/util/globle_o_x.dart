import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_x_game/util/list_and_globle.dart';

TextEditingController controllerO=TextEditingController();
TextEditingController controllerX=TextEditingController();
TextEditingController controllerAuto=TextEditingController();
String O='O';
String X='X';
String autoOX='*';
int colorIndex=0;
int colorIndexUnder=colorListFile.length-1;

File? fileImage;
ImagePicker imagePicker=ImagePicker();