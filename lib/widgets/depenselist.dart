import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/models/budget.dart';
import 'package:gestionbudget/models/depenses.dart';
import 'package:gestionbudget/providers/budget.dart';
import 'package:gestionbudget/providers/depenses.dart';
import 'package:provider/provider.dart';

class Depenselist extends StatefulWidget {
  Depenselist({required this.depenseList});
  final List<Depense> depenseList;

  @override
  State<Depenselist> createState() => _DepenselistState();
}

class _DepenselistState extends State<Depenselist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Liste des depenses",
              style: TextStyle(
                  color: AppColor.secondarycolor, fontWeight: FontWeight.bold),
            ),
          ),
          Consumer<BudgetProvider>(
            builder: (context, depenseData, child) {
              return Expanded(
                child: depenseData.depenses.isEmpty
                    ? Center(
                        child: Text("pas de depense"),
                      )
                    : ListView.builder(
                        itemCount: depenseData.depenses.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(
                                  '${depenseData.depenses[index].category.toUpperCase()}'),
                              subtitle: Text(
                                  '${depenseData.depenses[index].montant}'),
                              trailing: InkWell(
                                onTap: () {
                                  Provider.of<BudgetProvider>(context,
                                          listen: false)
                                      .deleDepense(depenseData.depenses[index]);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: AppColor.secondarycolor,
                                ),
                              ));
                        }),
              );
            },
          )
        ],
      ),
    );
  }
}
