import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: Home1(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  File? _selectedImage; // ตัวแปรเก็บรูปภาพที่ผู้ใช้เลือก
  int _selectedIndex = 0; // เก็บสถานะไอคอนที่เลือกใน BottomNavigationBar

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // อัปเดตสถานะไอคอนที่เลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // สีพื้นหลัง
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // กดเพื่อแจ้งเตือน
          },
          icon: Icon(Icons.notifications, color: Colors.black),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "LOGO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "โพสต์ใหม่",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // เพิ่ม action ได้
            },
            icon: Icon(Icons.settings, color: Colors.transparent),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่ม "X"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("X"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่ม "ถัดไป"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("ถัดไป"),
                ),
              ],
            ),
            SizedBox(height: 20),

            // กรอบใส่รูปภาพสัตว์
            GestureDetector(
              onTap: _pickImage, // เปิดตัวเลือกเลือกรูปภาพเมื่อกด
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: _selectedImage != null
                      ? DecorationImage(
                    image: FileImage(_selectedImage!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: _selectedImage == null
                    ? Center(
                  child: Text(
                    "ใส่รูปภาพสัตว์",
                    style: TextStyle(color: Colors.black54),
                  ),
                )
                    : null,
              ),
            ),
            SizedBox(height: 20),

            // กรอบข้อความรายละเอียดเพิ่มเติม
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                maxLines: null, // สามารถพิมพ์หลายบรรทัดได้
                decoration: InputDecoration(
                  hintText: 'พิมพ์ข้อความรายละเอียดเพิ่มเติมเกี่ยวกับสัตว์ที่นี่...',
                  hintStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none, // ไม่มีขอบ
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[100],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.search, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.add, 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 3),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: _selectedIndex == index ? Colors.white : Colors.transparent,
      child: Icon(
        icon,
        color: _selectedIndex == index ? Colors.blue : Colors.black,
      ),
    );
  }
}
