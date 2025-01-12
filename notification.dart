import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
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
          Text(
            'การแจ้งเตือน',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Create rounded buttons
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[200],
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                );
              }),
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
