import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galleryapp/main.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreeen extends StatefulWidget {
  HomeScreeen({Key? key}) : super(key: key);

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  File? image;

  Future pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade700,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.5),
          title: const Text("Gallery App"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              image != null
                  ? ClipOval(
                    child: Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                  )
                  : const FlutterLogo(
                      size: 160,
                    ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Image Picker",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              buildButton(
                onClicked: () {
                  pickImage(ImageSource.gallery);
                },
                icon: Icons.image_outlined,
                title: "Pick Gallery",
              ),
              const SizedBox(
                height: 20,
              ),
              buildButton(
                title: "Pick Camera",
                icon: Icons.camera_alt_outlined,
                onClicked: () {
                  pickImage(ImageSource.camera);
                },
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
          ),
          const SizedBox(width: 16),
          Text(title),
        ],
      ),
    );
