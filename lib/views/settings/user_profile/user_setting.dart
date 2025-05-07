import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gyaanplant_learning_app/components/login/green_button.dart';
import 'package:gyaanplant_learning_app/urls/url.dart';
import 'package:gyaanplant_learning_app/views/fill_profile_screen/fill_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileSettingScreen extends StatefulWidget {
  const UserProfileSettingScreen({super.key});

  @override
  State<UserProfileSettingScreen> createState() =>
      _UserProfileSettingScreenState();
}

class _UserProfileSettingScreenState extends State<UserProfileSettingScreen> {
  File? _imageFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _uploadedImageUrl;
  String? _userProfilePhoto;

  @override
  void initState() {
    super.initState();
    getUserPhoto();
  }

  Future<void> getUserPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userProfilePhoto = prefs.getString('userProfilePic');
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      _uploadedImageUrl = await AppUrl.uploadImage(_imageFile!);

      if (_uploadedImageUrl != null) {
        Fluttertoast.showToast(
          msg: 'Profile photo updated!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
        );
        print('uploaded img url: $_uploadedImageUrl');
      } else {
        Fluttertoast.showToast(
          msg: 'Failed to upload!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
        );
      }
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
                        : (_userProfilePhoto != null
                            ? NetworkImage(_userProfilePhoto!)
                            : null),
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
                    controller: _nameController,
                    hintText: 'Full Name',
                    keyboardType: TextInputType.name,
                  ),
                  TextWidget(
                    controller: _mobileController,
                    hintText: 'Mobile Number',
                    keyboardType: TextInputType.phone,
                  ),
                  TextWidget(
                    controller: _emailController,
                    hintText: 'Enter Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  GreenButton(
                    text: 'Save Chages',
                    onPressed: () async {
                      print('pressed');
                      print(_nameController.text);
                      print(_emailController.text);
                      print(_mobileController.text);
                      await AppUrl.updateUserProfile(
                        name: _nameController.text,
                        email: _emailController.text,
                        phone: _mobileController.text,
                        profilePic: _uploadedImageUrl ?? '',
                      );
                      print('over');
                      if (!mounted) return;
                      Navigator.pop(context, true);
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
