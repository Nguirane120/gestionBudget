enum DepenseCategory { loyer, connexion, fourniture, transport, ravitaillement }

class Depenses {
  double montant;
  DepenseCategory category;

  Depenses({required this.category, required this.montant});
}
