import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seciniz",
            style: GoogleFonts.quicksand(
                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.blue),
          ),
          Text(
            ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.00",
            style: GoogleFonts.quicksand(
                fontSize: 55, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          Text(
            "Ortalama",
            style: GoogleFonts.quicksand(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blue),
          )
        ]);
  }
}
