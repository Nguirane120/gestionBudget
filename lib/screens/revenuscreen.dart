import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/models/revenu.dart';
import 'package:gestionbudget/providers/budget.dart';
import 'package:gestionbudget/screens/revenuformsscreen.dart';
import 'package:provider/provider.dart';

class Revenuscreen extends StatefulWidget {
  const Revenuscreen({super.key});

  @override
  State<Revenuscreen> createState() => _RevenuscreenState();
}

class _RevenuscreenState extends State<Revenuscreen> {
  List<Revenu> revenus = [];

  void _ajouterRevenu(Revenu revenu) {
    setState(() {
      revenus.add(revenu);
    });
  }

  void goToRevenuForm() async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Revenuformsscreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          }),
    );

    if (result != null && result is Revenu) {
      _ajouterRevenu(result);
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
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Liste des revenus",
                style: TextStyle(
                    color: AppColor.secondarycolor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<BudgetProvider>(builder: (context, revenuData, child) {
              return Expanded(
                child: revenuData.revenus.isEmpty
                    ? Center(
                        child: Text("pas de revenu"),
                      )
                    : ListView.builder(
                        itemCount: revenuData.revenus.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(
                                  '${revenuData.revenus[index].source.toUpperCase()}'),
                              subtitle:
                                  Text('${revenuData.revenus[index].montant}'),
                              trailing: InkWell(
                                onTap: () {
                                  Provider.of<BudgetProvider>(context,
                                          listen: false)
                                      .deleteRevnu(revenuData.revenus[index]);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: AppColor.secondarycolor,
                                ),
                              ));
                        }),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.secondarycolor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Revenuformsscreen();
            }));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
