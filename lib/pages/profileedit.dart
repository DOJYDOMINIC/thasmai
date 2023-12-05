import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Import MediaType
// import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thasmai/pages/home.dart';
import 'package:thasmai/widgets/bottombutton_w.dart';
import 'package:thasmai/widgets/textfiller.dart';
import 'dart:io';
import '../constants/consts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  File? preset = File("assets/images/person.jpg");
  File? _image;

  Future<File> createTemporaryFileFromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final List<int> bytes = data.buffer.asUint8List();
    final String tempFileName =
        DateTime.now().millisecondsSinceEpoch.toString();
    final File tempFile = File('${Directory.systemTemp.path}/$tempFileName');
    await tempFile.writeAsBytes(bytes, flush: true);
    return tempFile;
  }

  Future<void> sendMultipartRequest() async {
    if (_image == null || _image!.path.isEmpty) {
      _image = await createTemporaryFileFromAsset(person);
    }
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.50:3000/api/user/upload'));

    // Add other fields if needed
    request.fields['regNo'] = 'dojy';
    request.fields['phone'] = 'orginal';
    request.fields['password'] = '12345';

    // Add the image as a MultipartFile using the picked image path

    var defaultImageFile = await http.MultipartFile.fromPath(
      'image',
      _image!.path,
      contentType: MediaType('image', 'jpeg'),
    );
    request.files.add(defaultImageFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print("pickedImagePath: ${_image!.path}");
        print('Request sent successfully');
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
        print("pickedImagePath: ${_image!.path}");
      }
    } catch (error) {
      print('Error sending request: $error');
      print("pickedImagePath: ${_image!.path}");
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 15);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  final TextEditingController _username = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _district = TextEditingController();
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  bool isPressed = false;
  void ButtonState() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isPressed = !isPressed;
      });
    });
  }

  double si = 15;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print("Current image: $_image");

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.1,
              image: AssetImage(bgimage),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (BuildContext context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu,
                                color: Colors.black, size: 35),
                          );
                        },
                      ),
                      SizedBox(width: 45, height: 45, child: Image.asset(logo))
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade400,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 57,
                          backgroundImage: _image != null
                              ? Image.file(File(_image!.path)).image
                              : const AssetImage(person),
                        ),
                      ),
                      Positioned(
                        left: width / 4.7,
                        top: height * .09,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                          fontWeight:
                                                              FontWeight.bold)),
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
                            color: Colors.grey.shade700,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ElevatedButton(onPressed: (){
                  //   sendMultipartRequest();
                  // }, child: Text("click")),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            profile,
                            style: headstyl,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      TextFiller(
                          controller: _username,
                          hinttxt: username,
                          onchanged: (val) {}),
                      Padding(
                        padding: EdgeInsets.only(top: si, bottom: si),
                        child: TextFiller(
                            controller: _phone,
                            hinttxt: phone,
                            onchanged: (val) {}),
                      ),
                      TextFiller(
                          controller: _dob, hinttxt: dob, onchanged: (val) {}),
                      Padding(
                        padding: EdgeInsets.only(top: si, bottom: si),
                        child: TextFiller(
                            controller: _email,
                            hinttxt: email,
                            onchanged: (val) {}),
                      ),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(13)),
                        padding: const EdgeInsets.only(left: 10),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: address,
                            hintStyle: TextStyle(color: blackcolor),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          cursorColor: Colors.black,
                          maxLines: null, // Allow text to wrap to the next line
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: si, bottom: si),
                        child: TextFiller(
                            controller: _pincode,
                            hinttxt: pincode,
                            onchanged: (val) {}),
                      ),
                      TextFiller(
                          controller: _state,
                          hinttxt: state,
                          onchanged: (val) {}),
                      Padding(
                        padding: EdgeInsets.only(top: si, bottom: si),
                        child: TextFiller(
                            controller: _district,
                            hinttxt: district,
                            onchanged: (val) {}),
                      ),
                      const Row(
                        children: [
                          Text(
                            idproof,
                            style: headstyl,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: si,
                      ),
                      Container(
                        height: 500,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: si),
                              child: TextFiller(
                                  controller: controllers[index],
                                  hinttxt: hints[index],
                                  onchanged: (val) {}),
                            );
                          },
                        ),
                      ),
                      BottomButton(
                        boolval: isPressed,
                        buttontext: contnu,
                        ontap: () {
                          ButtonState();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: si,
                      ),
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
}
