import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Cines extends StatelessWidget {
  Cines({super.key});
  // Lista de cines y sus ubicaciones
  final List<Map<String, dynamic>> cines = [
    {
      'nombre': 'CINERAMA PACIFICO',
      'direccion': 'AV JOSE PARDO 121 MIRAFLORES - LIMA - LIMA',
      'latLng': LatLng(-12.116058, -77.025078), // Coordenadas
    },
    {
      'nombre': 'CINERAMA MINKA',
      'direccion':
          'AV ARGENTINA 3093 CC MINKA 2DO NIVEL CALLAO - CALLAO - CALLAO',
      'latLng': LatLng(-12.032415, -77.116173),
    },
    {
      'nombre': 'CINERAMA CHIMBOTE',
      'direccion':
          'AV. V. RAUL H. DE LA TORRE MZA. B LOTE. 1A SECTOR CAMPO FERIAL SAN P ANCASH SANTA CHIMBOTE',
      'latLng': LatLng(-9.071468, -78.587353),
    },
    {
      'nombre': 'CINERAMA QUINDE',
      'direccion': 'AV LOS MAESTROS S/N CC EL QUINDE',
      'latLng': LatLng(-6.668094, -78.577063),
    },
    {
      'nombre': 'CINERAMA TARAPOTO',
      'direccion': 'AV ALFONSO UGARTE 1360 SAN MARTIN - SAN MARTIN - TARAPOTO',
      'latLng': LatLng(-6.487082, -76.358792),
    },
    {
      'nombre': 'CINERAMA CAJAMARCA',
      'direccion':
          'JR SOR MANUELA GIL 151 CC EL QUINDE CAJAMARCA - CAJAMARCA - CAJAAMRCA',
      'latLng': LatLng(-7.166857, -78.507137),
    },
    {
      'nombre': 'CINERAMA SOL',
      'direccion': 'AV SAN MARTIN 727 CC PLAZA DEL SOL ICA - ICA - ICA',
      'latLng': LatLng(-14.085585, -75.736203),
    },
    {
      'nombre': 'CINERAMA HUACHO',
      'direccion': 'COLON 601 CC PLAZA DEL SOL 2DO NIVEL',
      'latLng': LatLng(-11.126031, -77.938942),
    },
    {
      'nombre': 'CINERAMA MOYOBAMBA',
      'direccion': 'JR MANUEL DEL AGUILA 542 MOYOBAMBA',
      'latLng': LatLng(-7.151313, -76.966579),
    },
    {
      'nombre': 'CINERAMA CUSCO',
      'direccion':
          'CALLE CRUZ VERDE 347 CC IMPERIAL ´PLAZA CUSCO - CUSCO - CUSCO',
      'latLng': LatLng(-13.517993, -71.978506),
    },
    {
      'nombre': 'CINERAMA PIURA',
      'direccion': 'AV GRAU 1460 CC. PLAZA DEL SOL',
      'latLng': LatLng(-5.194100, -81.031972),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitanos en estas direciones'),
        backgroundColor: const Color.fromARGB(255, 255, 239, 239),
      ),
      body: ListView.builder(
        itemCount: cines.length,
        itemBuilder: (context, index) {
          final cine = cines[index];
          return Padding(
            padding:
                const EdgeInsets.all(8.0), // Espaciado alrededor del Container
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.pink, width: 2), // Color y grosor del borde
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
                color: const Color.fromARGB(
                    255, 255, 255, 255), // Color de fondo del Container
              ),
              child: ListTile(
                title: Text(cine['nombre'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold)), // Estilo del título
                subtitle: Text(cine['direccion']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapaScreen(latLng: cine['latLng']),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapaScreen extends StatelessWidget {
  final LatLng latLng;

  const MapaScreen({super.key, required this.latLng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación en Mapa'),
        backgroundColor: Colors.pink,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('cine'),
            position: latLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor
                .hueBlue), // Cambia el color del marcador si deseas
            infoWindow: InfoWindow(
              title: 'Cine',
              snippet: 'Ubicación: ${latLng.latitude}, ${latLng.longitude}',
            ),
          ),
        },
      ),
    );
  }
}
