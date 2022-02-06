import 'package:flutter/material.dart';

class OrtalamaGosteren extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGosteren({
    required this.dersSayisi,
    required this.ortalama,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seciniz",
        style: TextStyle(fontSize: 18),
      ),
      Text(
        ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.00",
        style: TextStyle(fontSize: 55),
      ),
      Text("Ortalama")
    ]);
  }
}
