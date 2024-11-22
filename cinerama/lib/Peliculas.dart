import 'package:cinerama/Peli/VideoCar10.dart';
import 'package:cinerama/Peli/VideoCar15.dart';
import 'package:cinerama/Peli/VideoCar16.dart';
import 'package:cinerama/Peli/VideoCar17.dart';
import 'package:cinerama/Peli/VideoCar18.dart';
import 'package:cinerama/Peli/VideoCar19.dart';
import 'package:cinerama/Peli/VideoCar11.dart';
import 'package:cinerama/Peli/VideoCar12.dart';
import 'package:cinerama/Peli/VideoCar14.dart';
import 'package:cinerama/Peli/VideoCar13.dart';
import 'package:cinerama/Peli/VideoCar2.dart';
import 'package:cinerama/Peli/VideoCar20.dart';
import 'package:cinerama/Peli/VideoCar21.dart';
import 'package:cinerama/Peli/VideoCar22.dart';
import 'package:cinerama/Peli/VideoCar23.dart';
import 'package:cinerama/Peli/VideoCar24.dart';
import 'package:cinerama/Peli/VideoCar25.dart';
import 'package:cinerama/Peli/VideoCar26.dart';
import 'package:cinerama/Peli/VideoCar27.dart';
import 'package:cinerama/Peli/VideoCar28.dart';
import 'package:cinerama/Peli/VideoCar29.dart';
import 'package:cinerama/Peli/VideoCar30.dart';
import 'package:cinerama/Peli/VideoCar31.dart';
import 'package:cinerama/Peli/VideoCar32.dart';
import 'package:cinerama/Peli/VideoCar33.dart';
import 'package:cinerama/Peli/VideoCar34.dart';
import 'package:cinerama/Peli/VideoCar35.dart';
import 'package:cinerama/Peli/VideoCar3.dart';
import 'package:cinerama/Peli/VideoCar1.dart';
import 'package:cinerama/Peli/VideoCar4.dart';
import 'package:cinerama/Peli/VideoCar5.dart';
import 'package:cinerama/Peli/VideoCar6.dart';
import 'package:cinerama/Peli/VideoCar7.dart';
import 'package:cinerama/Peli/VideoCar8.dart';
import 'package:cinerama/Peli/VideoCar9.dart';
import 'package:flutter/material.dart';

class Peliculas extends StatelessWidget {
  Peliculas({super.key});

  // Datos de películas categorizadas
  final List<Map<String, dynamic>> categorias = [
    {
      'nombre': 'Animadas',
      'peliculas': [
        {
          'titulo': 'Orión y la oscuridad',
          'imagen': 'assets/images/movie/img11.jpg',
          'videoPage': VideoCar11(),
        },
        {
          'titulo': 'Kung Fu Panda 4',
          'imagen': 'assets/images/movie/img12.png',
          'videoPage': VideoCar12(),
        },
        {
          'titulo': 'Dragonkeeper',
          'imagen': 'assets/images/movie/img13.jpg',
          'videoPage': VideoCar13(),
        },
        {
          'titulo': 'Intensa mente 2',
          'imagen': 'assets/images/movie/img14.jpg',
          'videoPage': VideoCar14(),
        },
        {
          'titulo': 'Mi amigo el pingüino',
          'imagen': 'assets/images/movie/img3.jpg',
          'videoPage': VideoCar3(),
        },
      ],
    },
    {
      'nombre': 'Aventura',
      'peliculas': [
        {
          'titulo': 'El astronauta',
          'imagen': 'assets/images/movie/img34.jpg',
          'videoPage': VideoCar34(),
        },
        {
          'titulo': 'Monsters: El infierno del dragón',
          'imagen': 'assets/images/movie/img35.jpg',
          'videoPage': VideoCar35(),
        },
      ],
    },
    {
      'nombre': 'Terror',
      'peliculas': [
        {
          'titulo': 'No hables con Extraños',
          'imagen': 'assets/images/movie/img1.jpg',
          'videoPage': VideoCar1(),
        },
        {
          'titulo': 'he Conjuring: Last Rites',
          'imagen': 'assets/images/movie/img5.jpg',
          'videoPage': VideoCar5(),
        },
        {
          'titulo': 'Un lugar tranquilo 3',
          'imagen': 'assets/images/movie/img19.jpg',
          'videoPage': VideoCar19(),
        },
        {
          'titulo': 'La noche del demonio 6',
          'imagen': 'assets/images/movie/img20.png',
          'videoPage': VideoCar20(),
        },
      ],
    },
    {
      'nombre': 'Románticas',
      'peliculas': [
        {
          'titulo': 'Cualquiera menos Tú',
          'imagen': 'assets/images/movie/img15.jpg',
          'videoPage': VideoCar15(),
        },
        {
          'titulo': 'Rivales',
          'imagen': 'assets/images/movie/img16.jfif',
          'videoPage': VideoCar16(),
        },
        {
          'titulo': 'Secretos de un escándalo',
          'imagen': 'assets/images/movie/img17.jfif',
          'videoPage': VideoCar17(),
        },
        {
          'titulo': 'A través de tu mirada',
          'imagen': 'assets/images/movie/img18.png',
          'videoPage': VideoCar18(),
        },
      ],
    },
    {
      'nombre': 'Comedia',
      'peliculas': [
        {
          'titulo': 'Chicas malas',
          'imagen': 'assets/images/movie/img21.png',
          'videoPage': VideoCar21(),
        },
        {
          'titulo': 'Pobres criaturas',
          'imagen': 'assets/images/movie/img22.jpg',
          'videoPage': VideoCar22(),
        },
        {
          'titulo': 'Mascotas en apuros',
          'imagen': 'assets/images/movie/img2.jpg',
          'videoPage': VideoCar2(),
        },
        {
          'titulo': 'La chica del alquiler',
          'imagen': 'assets/images/movie/img9.jpg',
          'videoPage': VideoCar9(),
        },
      ],
    },
    {
      'nombre': 'Acción',
      'peliculas': [
        {
          'titulo': 'Avatar 3',
          'imagen': 'assets/images/movie/img4.jpeg',
          'videoPage': VideoCar4(),
        },
        {
          'titulo': 'Venom: El último baile',
          'imagen': 'assets/images/movie/img6.jpg',
          'videoPage': VideoCar6(),
        },
        {
          'titulo': 'Tron: Ares',
          'imagen': 'assets/images/movie/img10.jfif',
          'videoPage': VideoCar10(),
        },
        {
          'titulo': 'Misión hostil',
          'imagen': 'assets/images/movie/img23.jpg',
          'videoPage': VideoCar23(),
        },
      ],
    },
    {
      'nombre': 'Suspenso',
      'peliculas': [
        {
          'titulo': 'Joker: Folie à Deux',
          'imagen': 'assets/images/movie/img8.jpg',
          'videoPage': VideoCar8(),
        },
        {
          'titulo': 'Beekeeper: sentencia de muerte',
          'imagen': 'assets/images/movie/img24.jpg',
          'videoPage': VideoCar24(),
        },
        {
          'titulo': 'Bad Boys: hasta la muerte',
          'imagen': 'assets/images/movie/img25.jpg',
          'videoPage': VideoCar25(),
        },
        {
          'titulo': 'Arcardian',
          'imagen': 'assets/images/movie/img26.jpg',
          'videoPage': VideoCar26(),
        },
      ],
    },
    {
      'nombre': 'Series',
      'peliculas': [
        {
          'titulo': 'My Hero Academia',
          'imagen': 'assets/images/movie/img7.jpg',
          'videoPage': VideoCar7(),
        },
        {
          'titulo': 'Avatar la leyenda de aang',
          'imagen': 'assets/images/movie/img31.jfif',
          'videoPage': VideoCar31(),
        },
        {
          'titulo': 'A travez de mi ventana 3',
          'imagen': 'assets/images/movie/img32.jfif',
          'videoPage': VideoCar32(),
        },
        {
          'titulo': 'Arthur',
          'imagen': 'assets/images/movie/img33.jpg',
          'videoPage': VideoCar33(),
        },
      ],
    },
    {
      'nombre': 'Drama',
      'peliculas': [
        {
          'titulo': 'La idea de tenerte',
          'imagen': 'assets/images/movie/img27.jpg',
          'videoPage': VideoCar27(),
        },
        {
          'titulo': 'El conde de montecristo',
          'imagen': 'assets/images/movie/img28.jpg',
          'videoPage': VideoCar28(),
        },
        {
          'titulo': 'Millers girl',
          'imagen': 'assets/images/movie/img29.jpg',
          'videoPage': VideoCar29(),
        },
        {
          'titulo': 'Civil War',
          'imagen': 'assets/images/movie/img30.jpg',
          'videoPage': VideoCar30(),
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'En Cartelera',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final categoria = categorias[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            elevation: 2,
            child: ExpansionTile(
              title: Text(
                categoria['nombre'],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              iconColor: Colors.red, // Color del icono
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: categoria['peliculas'].length,
                  itemBuilder: (context, peliculaIndex) {
                    final pelicula = categoria['peliculas'][peliculaIndex];
                    return _buildCarteleraCard(
                      context,
                      pelicula['imagen'],
                      pelicula['videoPage'],
                      pelicula['titulo'], // Título de la película
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget para la tarjeta de película
  Widget _buildCarteleraCard(
      BuildContext context, String imagePath, Widget videoPage, String titulo) {
    return GestureDetector(
      onTap: () {
        // Navegar a la página de video correspondiente
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => videoPage,
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
