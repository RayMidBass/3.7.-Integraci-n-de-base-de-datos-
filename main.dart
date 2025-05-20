import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  void addUser() {
    db.collection("users").add({
      'name': 'Luis',
      'email': 'luis@email.com',
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Firebase + Flutter")),
        body: Center(
          child: ElevatedButton(
            onPressed: addUser,
            child: Text("Agregar usuario"),
          ),
        ),
      ),
    );
  }
}
