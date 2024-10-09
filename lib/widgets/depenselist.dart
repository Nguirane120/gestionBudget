import 'package:flutter/material.dart';
import 'package:gestionbudget/consts.dart';
import 'package:gestionbudget/models/depenses.dart';

class Depenselist extends StatefulWidget {
  Depenselist({required this.depenseList});
  final List<Depense> depenseList;

  @override
  State<Depenselist> createState() => _DepenselistState();
}

class _DepenselistState extends State<Depenselist> {
  late List<Depense> depenses;
  @override
  void initState() {
    super.initState();
    depenses = widget.depenseList;
  }

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
            child: depenses.isEmpty
                ? Center(
                    child: Text("pas de depense"),
                  )
                : ListView.builder(
                    itemCount: depenses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title:
                              Text('${depenses[index].category.toUpperCase()}'),
                          subtitle: Text('${depenses[index].montant}'),
                          trailing: InkWell(
                            onTap: () {
                              setState(() {
                                depenses.removeAt(index);
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
