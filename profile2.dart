import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _selectedImage; // ตัวแปรเก็บรูปภาพที่เลือก

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        elevation: 0,
        title: Text(
          'PROFILE',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Image
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    : null, // แสดงภาพที่เลือก
                child: _selectedImage == null
                    ? Icon(Icons.person, size: 50, color: Colors.black)
                    : null, // แสดงไอคอนหากไม่มีภาพ
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage, // เรียกใช้ฟังก์ชันเลือกภาพ
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'แก้ไขรูปภาพ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              // Text Fields
              _buildTextField('ชื่อ-นามสกุล'),
              SizedBox(height: 10),
              _buildTextField('ชื่อเล่น'),
              SizedBox(height: 10),
              _buildTextField('อายุ'),
              SizedBox(height: 10),
              _buildTextField('อีเมล'),
              SizedBox(height: 10),
              _buildTextField('เบอร์โทรศัพท์'),
              SizedBox(height: 20),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'บันทึก',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
