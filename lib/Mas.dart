import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Mas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),
          _buildListItem(
            context,
            'Próximos Estrenos',
            ProximosEstrenosScreen(),
          ),
          _buildListItem(
            context,
            'Libro de Reclamos',
            LibroDeReclamosScreen(),
          ),
          _buildListItem(
            context,
            'Solucionamos Tus Dudas',
            SolucionDudasScreen(),
          ),
          SizedBox(height: 20),
          _buildSocialMediaButtons(),
        ],
      ),
    );
  }

  // Método para construir los botones de redes sociales
  Widget _buildSocialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
          onPressed: () =>
              _launchURL('https://www.facebook.com/share/rrneL2yHgA36bWRg/'),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram,
              color: Colors.pink), // Cambiado a color rosa
          onPressed: () => _launchURL(
              'https://www.instagram.com/cinerama_officiel?igsh=ZWN0NTEyM3FoeWJs'),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.youtube, color: Colors.red),
          onPressed: () => _launchURL(
              'https://www.youtube.com/watch?v=Qdkt3I5-FG4&list=RDQdkt3I5-FG4&start_radio=1'),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
          onPressed: () => _launchURL('https://www.twitter.com'),
        ),
      ],
    );
  }

  // Método para construir un elemento de lista
  Widget _buildListItem(
      BuildContext context, String text, Widget destinationScreen) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(
                    255, 0, 0, 0)), // Cambiado a color rosa
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationScreen),
            );
          },
        ),
        Divider(color: Colors.pink[200]), // Cambiado a color rosa claro
      ],
    );
  }

  // Método para lanzar URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }
}

// Pantalla de próximos estrenos con noticias
class ProximosEstrenosScreen extends StatelessWidget {
  final List<String> noticias = [
    '¡Increíble! "La nueva aventura de los héroes" se estrena este viernes.',
    'No te pierdas "Amor en tiempos de guerra", un drama que te tocará el corazón.',
    'La secuela de "El viaje fantástico" llega a las salas el próximo mes.',
    '¿Listos para "Cine de terror"? ¡Estreno especial para Halloween!',
    'Los detalles de la nueva película de acción que está causando furor en redes.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Próximos Estrenos'),
          backgroundColor: Colors.pinkAccent), // Color de fondo de la AppBar
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(noticias[index],
                style: TextStyle(
                    color: const Color.fromARGB(
                        255, 0, 0, 0))), // Cambiado a color rosa
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Detalles',
                        style: TextStyle(
                            color: Colors.pink)), // Título en color rosa
                    content: Text('Detalles sobre: ${noticias[index]}',
                        style: TextStyle(
                            color:
                                Colors.pink)), // Color rosa para el contenido
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cerrar',
                            style: TextStyle(
                                color: Colors.pink)), // Botón en color rosa
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Pantalla de libro de reclamos
class LibroDeReclamosScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _mensajeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Libro de Reclamos'),
          backgroundColor: Colors.pinkAccent), // Color de fondo de la AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(
                          255, 0, 0, 0)), // Color rosa para la etiqueta
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor ingresa un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _mensajeController,
                decoration: InputDecoration(
                  labelText: 'Mensaje',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un mensaje';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.pink, // Color rosa para el fondo del botón
                  foregroundColor: Colors.white, // Color del texto del botón
                  side: BorderSide(
                      color: Colors.pink[200]!), // Contorno del botón
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Procesar el reclamo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reclamo enviado')),
                    );
                    // Limpiar campos
                    _nombreController.clear();
                    _correoController.clear();
                    _mensajeController.clear();
                  }
                },
                child: Text('Enviar Reclamo',
                    style: TextStyle(
                        color: Colors.white)), // Texto del botón en blanco
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pantalla de solución de dudas
class SolucionDudasScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _dudaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Solucionamos Tus Dudas'),
          backgroundColor: Colors.pinkAccent), // Color de fondo de la AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(
                          255, 0, 0, 0)), // Color rosa para la etiqueta
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dudaController,
                decoration: InputDecoration(
                  labelText: 'Duda',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu duda';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.pink, // Color rosa para el fondo del botón
                  foregroundColor: Colors.white, // Color del texto del botón
                  side: BorderSide(
                      color: Colors.pink[200]!), // Contorno del botón
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Procesar la duda
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Duda enviada')),
                    );
                    // Limpiar campos
                    _nombreController.clear();
                    _dudaController.clear();
                  }
                },
                child: Text('Enviar Duda',
                    style: TextStyle(
                        color: Colors.white)), // Texto del botón en blanco
              ),
            ],
          ),
        ),
      ),
    );
  }
}
