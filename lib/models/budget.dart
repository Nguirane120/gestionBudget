import 'package:gestionbudget/models/depenses.dart';
import 'package:gestionbudget/models/revenu.dart';

class Budget {
  List<Depense> depenses;
  List<Revenu> revenus;

  Budget({required this.depenses, required this.revenus});

  double get totalDepenses =>
      depenses.fold(0, (sum, depense) => sum + depense.montant);
  double get totalRevenus =>
      revenus.fold(0, (sum, revenu) => sum + revenu.montant);
  double get solde => totalRevenus - totalDepenses;
}
