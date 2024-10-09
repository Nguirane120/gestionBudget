import 'package:gestionbudget/models/depenses.dart';

class Depenseservice {
  List<Depenses> depenses = [
    Depenses(category: DepenseCategory.connexion, montant: 10000),
    Depenses(category: DepenseCategory.loyer, montant: 50000),
    Depenses(category: DepenseCategory.transport, montant: 12000),
    Depenses(category: DepenseCategory.ravitaillement, montant: 30000),
    Depenses(category: DepenseCategory.connexion, montant: 10000),
    Depenses(category: DepenseCategory.connexion, montant: 10000),
    Depenses(category: DepenseCategory.loyer, montant: 10000),
    Depenses(category: DepenseCategory.transport, montant: 10000),
  ];

  List<Depenses> getDepenses() {
    return depenses;
  }
}
