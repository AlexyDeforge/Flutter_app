class User {
   String nom;
   String nom2;
   bool abs;
   bool retard;


  User(String nom, String nom2, bool abs, bool retard) {
    this.nom = nom;
    this.nom2 = nom2;
    this.abs = abs;
    this.retard = retard;
  }

  User.fromJson(Map json)
      : nom = json['nom'],
        nom2 = json['prenom'],
        abs = false,
        retard = false;

  Map toJson() {
    return {'nom': nom, 'prenom': nom2, 'absent': abs, 'retard': retard};
  }
}