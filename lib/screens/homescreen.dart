import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/models/budget.dart';
import 'package:gestionbudget/models/depenses.dart';
import 'package:gestionbudget/models/revenu.dart';
import 'package:gestionbudget/providers/budget.dart';
import 'package:gestionbudget/screens/depenseform.dart';
import 'package:gestionbudget/widgets/containercontent.dart';
import 'package:gestionbudget/widgets/depenselist.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Depense> depenses = [];
  List<Revenu> revenus = [];
  double totalDepenses = 0.0;
  double totalRevenus = 0.0;
  double solde = 0.0;

  void _calculerTotaux() {
    totalDepenses = Budget(depenses: depenses, revenus: revenus).totalDepenses;
    totalRevenus = Budget(depenses: depenses, revenus: revenus).totalRevenus;
    solde = totalRevenus - totalDepenses;
  }

  void _ajouterDepense(Depense depense) {
    setState(() {
      depenses.add(depense);
      _calculerTotaux();
    });
  }

  void goTodepenseForm() async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Depenseform(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          }),
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
              someContaine: Provider.of<BudgetProvider>(context).totalRevenus),
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
                  someContaine:
                      Provider.of<BudgetProvider>(context).totalDepenses),
              Containercontent(
                  textContainer: "Solde",
                  widthContainer: 170,
                  heightContainer: 150,
                  someContaine: Provider.of<BudgetProvider>(context).solde),
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
