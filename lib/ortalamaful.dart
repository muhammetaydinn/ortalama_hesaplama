import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortalamahesapkodbir/dersListe.dart';
import 'package:ortalamahesapkodbir/ders.dart';
import 'package:ortalamahesapkodbir/ortalamakisim.dart';
import 'package:ortalamahesapkodbir/sabitdata.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaState createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double dropdownValue = 4;
  int kredivalue = 2;
  String savedString = "";
  List<String> tumHarfler = ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FF"];
  List<int> tumDort = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Ortalama Hesapla",
              style: GoogleFonts.quicksand(
                  fontSize: 25, fontWeight: FontWeight.w700)),
          centerTitle: true,
          shadowColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.blue,
          backgroundColor: Colors.transparent),
      body: Column(
        
        children: [
          Column(
            children: [
              Container(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: textformcartcurt(),
                            ), //text yeri
                            //dropdownbuttonlar yeri
                          ],
                        ),
                      ),
                    ), //ınput kısım

                    Expanded(
                      flex: 1,
                      child: OrtalamaGosteren(
                        dersSayisi: SabitData.tumEklenenD.length,
                        ortalama: SabitData.ortalamaHESAP(),
                      ),
                    ), //ortalama kısım
                  ],
                ),
              ),
            ],
          ),

          Expanded(child: DersListe(
            onDismissAbi: (index) {
              SabitData.tumEklenenD.removeAt(index);
              setState(() {});
            },
          )), // list kısım
        ],
      ),
    );
  }

  Widget textformcartcurt() {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              onSaved: (value) {
                setState(() {
                  savedString = value!;
                  print("onsavedd $savedString");
                });
              },
              validator: (s) {
                if (s!.length <= 0) {
                  return "Ders adını giriniz";
                } else
                  return null;
              },
              initialValue: savedString,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(148, 187, 222, 251),
                hintText: 'Eklemek istediğin dersi yazın',
                labelText: 'Ders *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<double>(
                    value: dropdownValue,
                    onChanged: (double? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        print("deger $dropdownValue");
                      });
                    },
                    items:
                        tumHarfler.map<DropdownMenuItem<double>>((String ali) {
                      return DropdownMenuItem<double>(
                        value: atama(ali),
                        child: Text(ali),
                      );
                    }).toList(),
                  ),
                ),
                DropdownButton<int>(
                  borderRadius: BorderRadius.circular(15),
                  value: kredivalue,
                  onChanged: (int? newValue) {
                    setState(() {
                      kredivalue = newValue!;
                      print("deger $kredivalue");
                    });
                  },
                  items: tumDort.map<DropdownMenuItem<int>>((int ali) {
                    return DropdownMenuItem<int>(
                      value: ali,
                      child: Text(ali.toString()),
                    );
                  }).toList(),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        dersekleOrtHesapla();
                      });
                    },

                    // {
                    //   print("icona basınca $savedString");
                    //   print("$dropdownValue ve $kredivalue ve $savedString");
                    //   listeyeEkle(dropdownValue, kredivalue, savedString!);
                    // },
                    icon: Icon(Icons.arrow_forward_ios_outlined)),
              ],
            ),
          ],
        ));
  }

  dersekleOrtHesapla() {
    if (formKey.currentState!.validate()) {
      setState(() {
        formKey.currentState!.save();
        var eklenecekDERS = Ders(
            ad: savedString,
            harfDegeri: dropdownValue,
            krediDegeri: kredivalue);
        SabitData.dersEkle(eklenecekDERS);
        print(SabitData.tumEklenenD);
        print(SabitData.ortalamaHESAP());
      });
    }
  }

  double atama(String h) {
    if (h == "AA") {
      return 4;
    } else if (h == "BA") {
      return 3.5;
    } else if (h == "BB") {
      return 3;
    } else if (h == "CB") {
      return 2.5;
    } else if (h == "CC") {
      return 2;
    } else if (h == "DC") {
      return 1.5;
    } else if (h == "DD") {
      return 1;
    } else {
      return 0;
    }
  }
}
