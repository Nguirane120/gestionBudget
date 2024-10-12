import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/models/revenu.dart';
import 'package:gestionbudget/screens/revenuformsscreen.dart';

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
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Liste des revenus",
              style: TextStyle(
                  color: AppColor.secondarycolor, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: revenus.isEmpty
                ? Center(
                    child: Text("pas de revenu"),
                  )
                : ListView.builder(
                    itemCount: revenus.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text('${revenus[index].source.toUpperCase()}'),
                          subtitle: Text('${revenus[index].montant}'),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                revenus.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: AppColor.secondarycolor,
                            ),
                          ));
                    }),
          )
        ],
      ),
    );
  }
}
