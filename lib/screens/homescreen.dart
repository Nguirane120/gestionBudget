import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/screens/depenseform.dart';
import 'package:gestionbudget/widgets/containercontent.dart';
import 'package:gestionbudget/widgets/depenselist.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primarycolor,
        centerTitle: true,
        title: Text(
          "Gestion du Budget",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Containercontent(
              textContainer: "Budget",
              widthContainer: 350.0,
              heightContainer: 150,
              someContaine: 120.000),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Containercontent(
                  textContainer: "Depense",
                  widthContainer: 170,
                  heightContainer: 150,
                  someContaine: 120.000),
              Containercontent(
                  textContainer: "Solde",
                  widthContainer: 170,
                  heightContainer: 150,
                  someContaine: 120.000),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(child: Depenselist())
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondarycolor,
        onPressed: () {},
        child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Depenseform();
              }));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}
