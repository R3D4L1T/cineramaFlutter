import 'package:cinerama/Butacas.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCar32 extends StatefulWidget {
  const VideoCar32({super.key});

  @override
  State<VideoCar32> createState() => _VideoCar32State();
}

class _VideoCar32State extends State<VideoCar32> {
  late YoutubePlayerController _youtubeController;
  String selectedTime = '5.45 PM'; // Horario por defecto
  String selectedLocation = 'CINERAMA CAJAMARCA'; // Ubicación por defecto

  // Mapa de precios por horario
  final Map<String, double> timePrices = {
    '3.30 PM': 6.50,
    '5.45 PM': 8.50,
    '7.45 PM': 9.50,
    '9.45 PM': 10.50,
  };

  // Mapa de descripciones de lugares
  final Map<String, String> locationDescriptions = {
    'CINERAMA PACIFICO':
        'DIRECCION: Av Jose pardo 121 Miraflores - Lima - Lima',
    'CINERAMA MINKA':
        'DIRECCION: Av Argentina 3093 cc Minka segundo nivel Callao - Callao - Callao',
    'CINERAMA CHIMBOTE':
        'DIRECCION: Av Raul H. De Le Torre Mza. B Lote. 1A sector campo feril san p Ancash Santa Chimbote',
    'CINERAMA TARAPOTO':
        'DIRECCION: Av Alfonso Ugarte 1360 San Martin - San Martin - Tarapoto',
    'CINERAMA CAJAMARCA':
        'DIRECCION: Jr Sor Manuela Gil 151 cc Megaplaza Cajamarca - Cajamarca - Cajamarca',
    'CINERAMA SOL':
        'DIRECCION: Av San Martin 727 cc Plaza del sol Ica - Ica - Ica',
    'CINERAMA HUACHO': 'DIRECCION: Colon 601 cc Plaza del Sol segundo nivel',
    'CINERAMA MOYOBAMBA': 'DIRECCION: Jr Manuel del Aguila 542 Moyobamba',
    'CINERAMA CUSCO':
        'DIRECCION: Calle Cruz Verde 347 cc Imperial Plaza Cusco - Cusco - Cusco',
    'CINERAMA PIURA': 'DIRECCION: Av Grau 1460 cc. Plaza del sol',
  };

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador de Youtube
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=mD99kkiYWhA')!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? precio = timePrices[selectedTime];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la Película'),
        backgroundColor: Colors.pink, // Color del AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.pink,
            ),
            const SizedBox(height: 16),
            const Text(
              'A travez de mi ventana 3',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Raquel y Ares mantienen una relación a distancia. Cuando se reencuentran durante el verano en los paisajes de la Costa Brava con sus amigos, ambos comienzan a preguntarse si su relación resistirá el paso del tiempo.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            const Text(
              'Horarios disponibles:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedTime,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTime = newValue!;
                });
              },
              items:
                  timePrices.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 46, 46, 46))),
                );
              }).toList(),
              dropdownColor: Colors.white,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
              style: const TextStyle(color: Color.fromARGB(255, 54, 54, 54)),
              elevation: 4,
            ),
            const SizedBox(height: 16),
            Text(
              'Precio: S/${precio?.toStringAsFixed(2) ?? '0.00'}',
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            const Text(
              'Selecciona un lugar:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedLocation,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue!;
                });
              },
              items: locationDescriptions.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 78, 78, 78))),
                );
              }).toList(),
              dropdownColor: Colors.white,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.teal),
              elevation: 4,
            ),
            const SizedBox(height: 8),
            Text(
              locationDescriptions[selectedLocation] ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Butacas(
                        pelicula: 'A travez de mi ventana 3',
                        precioBase: precio ?? 0.0,
                      ),
                    ),
                  );
                },
                child: const Text('Comprar Entrada'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
