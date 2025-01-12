import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo Section
            Center(
              child: Text(
                'LOGO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Profile Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 16),
                // Name Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อสัตว์',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ชื่อคนโพส',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Content Section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Text(
                    'แสดงรายละเอียดเพิ่มเติม เช่น ข้อมูลของสัตว์หรือรายละเอียดอื่น ๆ',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Register Button
            ElevatedButton(
              onPressed: () {
                // Add your action here
                print('สมัครสมาชิกสำเร็จ!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen, // Background color
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'สมัครสมาชิก',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
