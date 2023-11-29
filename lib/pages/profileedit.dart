import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../constants/consts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera, imageQuality: 15);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("Current image: $_image");

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: _image != null
                        ? Image.file(File(_image!.path)).image
                        : const AssetImage(logo),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height / 2.9,
              left: width / 1.9,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _pickImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Text(
                                          'Camera',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _pickImageFromGallery();
                                    Navigator.pop(context);
                                  },
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Text('Gallery',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.add_a_photo,
                  color: Colors.grey.shade300,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
