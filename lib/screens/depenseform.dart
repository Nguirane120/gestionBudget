import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/widgets/input.dart';

class Depenseform extends StatefulWidget {
  const Depenseform({super.key});

  @override
  State<Depenseform> createState() => _DepenseformState();
}

class _DepenseformState extends State<Depenseform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajouter depense",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primarycolor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("AJOUTER DEPENSE",
                style: TextStyle(color: AppColor.primarycolor)),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "TITRE",
                style: TextStyle(color: AppColor.primarycolor),
              ),
            ),
            InputWidget(placeholder: "electricite"),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "MONTANT",
                style: TextStyle(color: AppColor.primarycolor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InputWidget(placeholder: "12.000"),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColor.primarycolor),
                  color: AppColor.primarycolor),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "VALIDER",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
