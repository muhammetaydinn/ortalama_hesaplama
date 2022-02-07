import 'package:flutter/material.dart';
import 'package:ortalamahesapkodbir/sabitdata.dart';
import 'package:google_fonts/google_fonts.dart';

class DersListe extends StatelessWidget {
  final Function onDismissAbi;
  const DersListe({required this.onDismissAbi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SabitData.tumEklenenD.length > 0
        ? ListView.builder(
            itemCount: SabitData.tumEklenenD.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismissAbi(index);
                },
                child: Card(
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.blue),
                    ),
                    title: Text(
                      SabitData.tumEklenenD[index].ad,
                      style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                    subtitle: Text(
                      "Kredi: " +
                          SabitData.tumEklenenD[index].krediDegeri.toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                          SabitData.tumEklenenD[index].harfDegeri.toString()),
                    ),
                  ),
                ),
              );
            }),
          )
        : Container(
            child: Center(
                child: Text(
              "Lutfen ders ekleyiniz.",
              style: GoogleFonts.quicksand(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            )),
          );
  }
}
