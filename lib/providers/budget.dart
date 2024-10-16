import 'package:flutter/material.dart';
import 'package:gestionbudget/models/depenses.dart';
import 'package:gestionbudget/models/revenu.dart';

class BudgetProvider extends ChangeNotifier {
  List<Depense> _depenses = [];
  List<Revenu> _revenus = [];

  double get totalDepenses =>
      _depenses.fold(0.0, (sum, depense) => sum + depense.montant);
  double get totalRevenus =>
      _revenus.fold(0.0, (sum, revenu) => sum + revenu.montant);
  double get solde => totalRevenus - totalDepenses;

  List<Depense> get depenses => _depenses;
  List<Revenu> get revenus => _revenus;

  void ajouterDepense(Depense depense) {
    _depenses.add(depense);
    notifyListeners();
  }

  void ajouterRevenu(Revenu revenu) {
    _revenus.add(revenu);
    notifyListeners();
  }

  void deleDepense(Depense depense) {
    _depenses.remove(depense);
    notifyListeners();
  }

  void deleteRevnu(Revenu revenu) {
    _revenus.remove(revenu);
    notifyListeners();
  }
}
