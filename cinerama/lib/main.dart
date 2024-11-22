import 'package:cinerama/Buscar.dart';
import 'package:cinerama/Inicio.dart';
import 'package:cinerama/Login.dart';
import 'package:flutter/material.dart';
import 'package:cinerama/Peliculas.dart';
import 'package:cinerama/Cines.dart';
import 'package:cinerama/Snacks.dart';
import 'Mas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CINERAMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String? userName; // Variable para almacenar el nombre del usuario

  List<Widget> _widgetOptions() {
    return <Widget>[
      Inicio(),
      Peliculas(),
      Cines(),
      Snacks(
        selectedSeats: [],
        pelicula: '',
        precioTotal: 0.0,
      ),
      Mas(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'CINERAMA';
      case 1:
        return 'Películas';
      case 2:
        return 'Cines';
      case 3:
        return 'Snacks';
      default:
        return 'Más opciones';
    }
  }

  void _navigateToLogin() async {
    // Navegar a la pantalla de inicio de sesión y obtener el nombre del usuario al regresar
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );

    // Si el usuario inició sesión y devuelve un nombre, lo actualizamos
    if (result != null && result is String) {
      setState(() {
        userName = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
        actions: [
          userName != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Center(
                    child: Text(
                      userName!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: _navigateToLogin,
                ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Buscar()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Películas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Cines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Snacks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Más',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 255, 250, 250),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
