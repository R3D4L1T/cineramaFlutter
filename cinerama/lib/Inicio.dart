import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _currentIndex = 0; // Índice de la imagen actual

  // Lista de imágenes y sus respectivas descripciones y títulos
  final List<Map<String, String>> imgList = [
    {
      'image': 'assets/images/movie/img1.jpg',
      'title': 'No hables con Extraños',
      'description':
          'Unas vacaciones increíbles se convierten en una horrible pesadilla a manos de unos anfitriones que ocultan una oscuridad indescriptible.',
    },
    {
      'image': 'assets/images/movie/img2.jpg',
      'title': 'Mascota en Apuros',
      'description':
          'Perdidos en un aeropuerto durante un viaje familiar, la perra Gracie y el gato Pedro deben dejar de lado sus diferencias para encontrar el camino a casa.',
    },
    {
      'image': 'assets/images/movie/img3.jpg',
      'title': 'Mi amigo el Pingüino',
      'description':
          'Un pescador melancólico encuentra a un pingüino vagando por el océano, empapado en petróleo. No solo salva al animal, sino que empieza a cuidarlo y, por primera vez en mucho tiempo, se siente feliz.',
    },
    {
      'image': 'assets/images/movie/img4.jpeg',
      'title': 'Avatar 3',
      'description':
          'Avatar Fire and Ash se lanzará el 19 de diciembre de 2025, continuando la saga de Jake Sully y los Navi. La película presenta nuevos personajes y se centra en Ash People. Loak, el hijo de Jake, narrará esta entrega.',
    },
    {
      'image': 'assets/images/movie/img5.jpg',
      'title': 'The Conjuring: Last Rites',
      'description':
          'Dirigida por Michael Chaves, quien también dirigió la tercera entrega, será el 25 de setiembre del 2025. Esta noticia ha sido confirmada a través del medio de comunicación de The Hollywood Reporter.',
    },
    {
      'image': 'assets/images/movie/img6.jpg',
      'title': 'Venom: El último baile',
      'description':
          'El Último Baile es una próxima película estadounidense de superhéroes de 2024, basada en el personaje de Marvel Comics, Venom. La secuela de Venom y Venom: Let There Be Carnage, y la quinta película del Universo Spider-Man de Sony, fue escrita y dirigida y coproducida por Kelly Marcel.',
    },
    {
      'image': 'assets/images/movie/img7.jpg',
      'title': 'My Hero Academia',
      'description':
          'My Hero Academia es un manga escrito e ilustrado por Kōhei Horikoshi. Se basa en un one-shot realizado por el mismo autor y publicado en el quinto volumen del manga Ōmagadoki Dōbutsuen bajo el nombre de My Hero.​​ El 11 de enero de 2015, fue lanzado un VOMIC basado en el manga.​Ha originado varios mangas derivados.',
    },
    {
      'image': 'assets/images/movie/img8.jpg',
      'title': 'Joker: Folie à Deux',
      'description':
          'El comediante fracasado Arthur Fleck conoce al amor de su vida, Harley Quinn, mientras está en el Hospital Estatal de Arkham. Al ser liberados, la pareja se embarca en una aventura romántica.',
    },
    {
      'image': 'assets/images/movie/img9.jpg',
      'title': 'La chica del alquiler',
      'description':
          'Sebastián pensó que había encontrado el amor de su vida, pero es abruptamente abandonado por Lorena. En su búsqueda desesperada, llega a la casa que alquilaron para su luna de miel y conoce a Valeria, quien intenta ayudarlo a recuperar a Lorena.',
    },
    {
      'image': 'assets/images/movie/img10.jfif',
      'title': 'Tron: Ares',
      'description':
          'Ares es una próxima película estadounidense de ciencia ficción producida por Walt Disney Pictures y distribuida por Walt Disney Studios Motion Pictures. Sirve como secuela independiente de Tron y Tron: Legacy.',
    },
    // Agrega más imágenes según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Estreno',
            style: TextStyle(),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (BuildContext context, int index, int realIdx) {
                final item = imgList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    image: DecorationImage(
                      image: AssetImage(item['image']!),
                      fit: BoxFit.fill, // Ajustar el ajuste de la imagen
                    ),
                  ),
                  height: 500.0, // Altura del carrusel
                );
              },
              options: CarouselOptions(
                height: 350.0, // Altura del carrusel
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(
                    seconds: 3), // Cambiar de imagen cada 3 segundos
                aspectRatio: 20 / 20,
                autoPlayCurve: Curves.easeInOut,
                enableInfiniteScroll: true,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Actualiza el índice actual
                  });
                },
              ),
            ),
            // Mostrar título y descripción correspondiente a la imagen actual
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    imgList[_currentIndex][
                        'title']!, // Solo muestra el título de la imagen actual
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    imgList[_currentIndex]['description']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: 20, // Número máximo de líneas
                    overflow:
                        TextOverflow.ellipsis, // Ellipsis para desbordamiento
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
