import 'package:flutter_test/flutter_test.dart';
import 'package:gestionbudget/models/depenses.dart';

void main() {
  test("test creation de depnse", () {
    final depense = Depense(category: "Internet", montant: 14000.0);

    final category = 'Internet';
    final montant = 14000.0;

    expect(depense.category, category);
    expect(depense.montant, montant);
  });
}
