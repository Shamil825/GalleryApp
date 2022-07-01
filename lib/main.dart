

import 'package:flutter/material.dart';
import 'package:galleryapp/homescreen.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
    
       
    
      home:  HomeScreeen(),  
    );
  }
}

