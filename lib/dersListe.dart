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
                    title: Text(SabitData.tumEklenenD[index].ad),
                  ),
                ),
              );
            }),
          )
        : Container(
            child: Center(
                child: Text(
              "Lutfen ders ekleyiniz.",
              style: GoogleFonts.roboto(),
            )),
          );
  }
}
