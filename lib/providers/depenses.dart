import 'package:flutter/material.dart';
import 'package:gestionbudget/models/depenses.dart';

class DepenseData extends ChangeNotifier {
  List<Depense> depenses = [
    Depense(category: "Electricite", montant: 120000.0),
    Depense(category: "Internet", montant: 500000.0)
  ];
}
