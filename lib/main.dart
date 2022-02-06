import 'package:flutter/material.dart';
import 'package:ortalamahesapkodbir/ortalamaful.dart';
import 'package:ortalamahesapkodbir/sabitdata.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ortalama hesapla",
      theme: ThemeData(
        primaryColor: SabitData.temarenk,
      ),
      home: OrtalamaHesapla(),
    );
  }
}
