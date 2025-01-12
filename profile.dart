import 'package:flutter/material.dart';
import 'profile2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'LOGO',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          // Circle avatar for profile picture
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 20),
          // Buttons for "Edit Profile" and "Share Profile"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to profile2.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'แก้ไขโปรไฟล์',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'แชร์โปรไฟล์',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          // Section to display posts or information
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'แสดงรูปข้อมูลที่เคยโพส',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
