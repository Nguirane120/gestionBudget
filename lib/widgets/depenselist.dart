import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/serivices/depenseservice.dart';

class Depenselist extends StatefulWidget {
  const Depenselist({super.key});

  @override
  State<Depenselist> createState() => _DepenselistState();
}

class _DepenselistState extends State<Depenselist> {
  Depenseservice depenseservice = Depenseservice();
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
          Expanded(
            child: ListView.builder(
                itemCount: depenseservice.getDepenses().length,
                itemBuilder: (context, index) {
                  final depense = depenseservice.getDepenses()[index];
                  return ListTile(
                      title: Text('${depense.category.name.toUpperCase()}'),
                      subtitle: Text('${depense.montant}'),
                      trailing: InkWell(
                        onTap: () {},
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
