import 'package:flutter/material.dart';
import 'patientFormData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pancreatite App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PatientFormData(), 
    );
  }
}

