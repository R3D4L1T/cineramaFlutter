import 'package:flutter/material.dart';
import 'Snacks.dart'; // Asegúrate de que la pantalla Snacks exista

class LetraColor {
  final String letra;
  final Color color;

  LetraColor(this.letra, this.color);
}

class Butacas extends StatefulWidget {
  final String pelicula; // Nombre de la película
  final double precioBase; // Precio de la entrada base

  const Butacas({
    super.key,
    required this.pelicula,
    required this.precioBase,
  });

  @override
  _ButacasState createState() => _ButacasState();
}

class _ButacasState extends State<Butacas> {
  List<List<bool>> butacas =
      List.generate(13, (i) => List.generate(8, (j) => false));
  List<String> seleccionadas = [];

  List<LetraColor> letrasFilas = List.generate(
    13,
    (index) => LetraColor(String.fromCharCode(65 + index),
        Colors.amber), // Genera letras A, B, C, ...
  );

  @override
  Widget build(BuildContext context) {
    double precioTotal = widget.precioBase * seleccionadas.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar asientos'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Película: ${widget.pelicula}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Precio Total: S/. ${precioTotal.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLeyenda(Colors.green, 'Tu butaca', Colors.green),
                _buildLeyenda(Colors.white, 'Disponible', Colors.white),
                _buildLeyenda(Colors.red, 'No disponible', Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Center(
              child: Text(
                'PANTALLA',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: butacas.length,
              itemBuilder: (context, rowIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        letrasFilas[rowIndex].letra,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: letrasFilas[rowIndex].color,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 8,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: 1,
                        ),
                        shrinkWrap: true,
                        itemCount: butacas[rowIndex].length,
                        itemBuilder: (context, colIndex) {
                          bool isOcupada = butacas[rowIndex][colIndex];
                          bool isSeleccionada = seleccionadas.contains(
                              'Fila ${letrasFilas[rowIndex].letra}, Asiento ${colIndex + 1}');

                          return GestureDetector(
                            onTap: () {
                              if (!isOcupada) {
                                setState(() {
                                  String butaca =
                                      'Fila ${letrasFilas[rowIndex].letra}, Asiento ${colIndex + 1}';
                                  if (isSeleccionada) {
                                    seleccionadas.remove(butaca);
                                  } else {
                                    seleccionadas.add(butaca);
                                  }
                                });
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              size: 30,
                              color: isOcupada
                                  ? Colors.red
                                  : isSeleccionada
                                      ? Colors.green
                                      : Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        letrasFilas[rowIndex].letra,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: letrasFilas[rowIndex].color,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: seleccionadas.isNotEmpty
                    ? Colors.pink
                    : const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: seleccionadas.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Snacks(
                            selectedSeats: seleccionadas,
                            pelicula: widget
                                .pelicula, // Usar el nombre de la película
                            precioTotal:
                                precioTotal, // Calcular el precio total
                          ),
                        ),
                      );
                    },
              child: const Text('Comprar'),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildLeyenda(Color color, String texto, Color textColor) {
    return Row(
      children: [
        Icon(Icons.event_seat, color: color, size: 24),
        const SizedBox(width: 5),
        Text(
          texto,
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      ],
    );
  }
}
