import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/views/fill_profile_screen/fill_profile.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileSettingScreen extends StatefulWidget {
  const UserProfileSettingScreen({super.key});

  @override
  State<UserProfileSettingScreen> createState() =>
      _UserProfileSettingScreenState();
}

class _UserProfileSettingScreenState extends State<UserProfileSettingScreen> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      Fluttertoast.showToast(
        msg: 'Profile photo updated!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'No image selected!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                spreadRadius: 0,
                offset: Offset(0, 0),
                color: Color.fromRGBO(179, 32, 115, 0.18),
              )
            ],
          ),
          child: AppBar(
            title: const Text(
              'My Profile',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!) as ImageProvider
                        : AssetImage('assets/images/home/Avatar.png'),
                    radius: 60.0,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Image.asset('assets/images/home/Group62.png'),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  TextWidget(
                    hintText: 'Full Name',
                    keyboardType: TextInputType.name,
                  ),
                  TextWidget(
                    hintText: 'Mobile Number',
                    keyboardType: TextInputType.phone,
                  ),
                  TextWidget(
                    hintText: 'Enter Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  // TextWidget(
                  //   hintText: 'Aadhaar Number',
                  //   keyboardType: TextInputType.emailAddress,
                  // ),
                  GreenButton(
                    text: 'Save Chages',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
