import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController ctrAngka1 = new TextEditingController();
  TextEditingController ctrAngka2 = new TextEditingController();
  bool loadHasil = false;
  String hasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: ctrAngka1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "input angka 1"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: ctrAngka2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "input angka 2"),
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: () {
                            int angkasatu = int.parse(ctrAngka1.text);
                            int angkadua = int.parse(ctrAngka2.text);
                            hasil = (angkasatu + angkadua).toString();
                            setState(() {
                              loadHasil = true;
                            });
                          },
                          child: Text("Plus")),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          onPressed: () {
                            int angkasatu = int.parse(ctrAngka1.text);
                            int angkadua = int.parse(ctrAngka2.text);
                            hasil = (angkasatu - angkadua).toString();
                            setState(() {
                              loadHasil = true;
                            });
                          }, child: Text("Minus")),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child:
                          ElevatedButton(onPressed: () {
                            int angkasatu = int.parse(ctrAngka1.text);
                            int angkadua = int.parse(ctrAngka2.text);
                            hasil = (angkasatu * angkadua).toString();
                            setState(() {
                              loadHasil = true;
                            });
                          }, child: Text("Kali")),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child:
                          ElevatedButton(onPressed: () {
                            int angkasatu = int.parse(ctrAngka1.text);
                            int angkadua = int.parse(ctrAngka2.text);
                            hasil = (angkasatu / angkadua).toString();
                            setState(() {
                              loadHasil = true;
                            });
                          }, child: Text("Bagi")),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                loadHasil == false ? "Hasil" : hasil,
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
