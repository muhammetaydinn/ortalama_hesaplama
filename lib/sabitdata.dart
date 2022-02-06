import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ortalamahesapkodbir/ders.dart';

class SabitData {
  static const temarenk = Colors.pink;
  static List<Ders> tumEklenenD = [];
  static dersEkle(Ders ders) {
    tumEklenenD.add(ders);
  }

  static double ortalamaHESAP() {
    double toplamNot = 0;
    double toplamKredi = 0;
    tumEklenenD.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }
}
