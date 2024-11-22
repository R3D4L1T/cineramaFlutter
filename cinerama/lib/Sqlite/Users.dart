class Users {
  final int? usrId;
  final String usrEmail;
  final String usrPassword;
  final String? usrNombres; // Campos opcionales
  final String? usrApellidos; // Campos opcionales
  final String? usrCelular; // Campos opcionales

  Users({
    this.usrId,
    required this.usrEmail,
    required this.usrPassword,
    this.usrNombres,
    this.usrApellidos,
    this.usrCelular,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrId"],
        usrEmail: json["usrEmail"],
        usrPassword: json["usrPassword"],
        usrNombres: json["usrNombres"],
        usrApellidos: json["usrApellidos"],
        usrCelular: json["usrCelular"],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrEmail": usrEmail,
        "usrPassword": usrPassword,
        "usrNombres": usrNombres,
        "usrApellidos": usrApellidos,
        "usrCelular": usrCelular,
      };
}
