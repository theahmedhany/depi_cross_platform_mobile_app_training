import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('Home'),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0, 5))],
            ),
            padding: EdgeInsets.all(20.0),
            child: Text('Welcome to the Home Page', style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
