import 'package:cinerama/CrearCuenta.dart';
import 'package:flutter/material.dart';
import 'package:cinerama/Sqlite/Users.dart';
import 'package:cinerama/Sqlite/DatabaseHelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userEmail = TextEditingController();
  final password = TextEditingController();
  bool isVisible = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();

  // Método para iniciar sesión
  Future<void> login() async {
    var response = await db
        .login(Users(usrEmail: userEmail.text, usrPassword: password.text));
    if (response) {
      // Suponemos que tienes un método para obtener el nombre del usuario.
      String? userName = await db.getUserNameByEmail(userEmail.text);

      if (!mounted) return;

      // Envía el nombre del usuario de regreso a la pantalla anterior
      Navigator.pop(context, userName);
    } else {
      setState(() {
        isLoginTrue =
            true; // Muestra mensaje de error si las credenciales son incorrectas
      });
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/icon/cinerama.jpg",
                    width: 210,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.pink.withOpacity(.2),
                    ),
                    child: TextFormField(
                      controller: userEmail,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.pink.withOpacity(.2),
                    ),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('Iniciar Sesion'),
                  ),
                  const SizedBox(height: 15),
                  if (isLoginTrue) // Usar "if" para condicional
                    const Text(
                      "El correo electrónico o la contraseña son incorrectos",
                      style: TextStyle(color: Colors.red),
                    ),
                  TextButton(
                    child: const Text("¿No tienes una cuenta? Inscribirse"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CrearCuenta()), // Asegúrate que CrearCuenta está bien implementado
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
