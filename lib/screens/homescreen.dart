import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/models/depenses.dart';
import 'package:gestionbudget/screens/depenseform.dart';
import 'package:gestionbudget/widgets/containercontent.dart';
import 'package:gestionbudget/widgets/depenselist.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Depense> depenses = [];

  void _ajouterDepense(Depense depense) {
    setState(() {
      depenses.add(depense);
    });
  }

  void goTodepenseForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Depenseform(),
      ),
    );

    if (result != null && result is Depense) {
      _ajouterDepense(result);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
          Expanded(child: Depenselist(depenseList: depenses))
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.secondarycolor,
          onPressed: goTodepenseForm,
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
