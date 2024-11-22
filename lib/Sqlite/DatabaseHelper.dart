import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cinerama/Sqlite/Users.dart';

class DatabaseHelper {
  final databaseName = "cinerama.db";

  // Definición de la tabla con los campos adicionales
  String usersTable = '''
    CREATE TABLE users (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT,
      usrEmail TEXT UNIQUE,
      usrPassword TEXT,
      usrNombres TEXT,
      usrApellidos TEXT,
      usrCelular TEXT
    )
  ''';

  // Inicialización de la base de datos
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(usersTable);
    });
  }

  // Función para crear una cuenta
  Future<int> crearCuenta(Users user) async {
    final Database db = await initDB();
    return db.insert('users', user.toMap());
  }

  // Función para iniciar sesión
  Future<bool> login(Users user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
      "SELECT * FROM users WHERE usrEmail = ? AND usrPassword = ?",
      [user.usrEmail, user.usrPassword],
    );
    return result.isNotEmpty;
  }

  // Función para obtener el nombre del usuario por su correo electrónico
  Future<String?> getUserNameByEmail(String email) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
      "SELECT usrNombres FROM users WHERE usrEmail = ?",
      [email],
    );

    if (result.isNotEmpty) {
      return result.first['usrNombres'] as String?;
    }
    return null;
  }
}
