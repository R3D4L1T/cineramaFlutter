import 'package:flutter/material.dart';
import 'MetodoPago.dart';

class Snacks extends StatefulWidget {
  final List<String> selectedSeats; // Butacas seleccionadas
  final String pelicula; // Nombre de la película
  final double precioTotal; // Precio total de las entradas

  const Snacks({
    super.key,
    required this.selectedSeats,
    required this.pelicula,
    required this.precioTotal,
  });

  @override
  State<Snacks> createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  final Map<int, int> _snackQuantities = {};
  double _totalSnacks = 0.0;

  final List<String> _categories = [
    'Combos',
    'Canchita',
    'Bebidas',
    'Golosinas',
  ];

  final Map<String, List<String>> _snackImages = {
    'Combos': [
      'assets/images/snacks/Combo1_Dulce.png',
      'assets/images/snacks/Combo1_Chico.jpg',
      'assets/images/snacks/Combo2_MedianoDulce.png',
      'assets/images/snacks/Combo2_Mediano.jpg',
      'assets/images/snacks/Combo3_GrandeDulce.png',
      'assets/images/snacks/Combo3_Grande.png',
      'assets/images/snacks/Combo4_GrandeDulce.png',
      'assets/images/snacks/Combo4_Mediano.png',
      'assets/images/snacks/Combo5_GrandeDulce.png',
      'assets/images/snacks/Combo5_Grande.png',
      'assets/images/snacks/Combocancha.png',
    ],
    'Canchita': [
      'assets/images/snacks/CanchaMediana.jpg',
      'assets/images/snacks/CanchaChica.jpg',
      'assets/images/snacks/CanchaDulceChica.jpg',
      'assets/images/snacks/CanchaGrande.jpg',
      'assets/images/snacks/CanchaGrandeDulce.jpg',
      'assets/images/snacks/CanchaMedianaDulce.jpg',
    ],
    'Bebidas': [
      'assets/images/snacks/BebidaChica.jpg',
      'assets/images/snacks/BebidaGrande.jpg',
      'assets/images/snacks/BebidaMediana.jpg',
    ],
    'Golosinas': [
      'assets/images/snacks/Chocman.png',
      'assets/images/snacks/Hersheys.png',
      'assets/images/snacks/M_M.png',
      'assets/images/snacks/Golpe.png',
    ],
  };

  final Map<String, List<double>> _snackPrices = {
    'Combos': [
      10.00,
      12.00,
      14.00,
      12.00,
      16.00,
      14.00,
      24.00,
      22.00,
      30.00,
      26.00,
      40.00
    ],
    'Canchita': [7.00, 6.00, 7.00, 8.00, 9.00, 8.00],
    'Bebidas': [6.00, 8.00, 7.00],
    'Golosinas': [4.50, 5.00, 5.00, 2.00],
  };

  @override
  Widget build(BuildContext context) {
    double precioTotalConSnacks = widget.precioTotal + _totalSnacks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Total a pagar'),
        backgroundColor: const Color.fromARGB(255, 222, 223, 224),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                Text("S/${precioTotalConSnacks.toStringAsFixed(2)}"),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            _buildMovieInfo(),
            _buildSelectedSeatsDisplay(),
            Expanded(
              child: ListView(
                children: _categories.map<Widget>((category) {
                  return _buildExpansionTile(category);
                }).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  List<Map<String, dynamic>> selectedSnacks =
                      _getSelectedSnacks();

                  if (selectedSnacks.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('No se ha seleccionado ningún snack.')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MetodoPago(
                        selectedSnacks: selectedSnacks,
                        selectedSeats: widget.selectedSeats,
                        total: precioTotalConSnacks,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Continuar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Película: ${widget.pelicula}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Precio Entradas: S/. ${widget.precioTotal.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedSeatsDisplay() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Butacas:',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Text(
            widget.selectedSeats.isNotEmpty
                ? widget.selectedSeats.join(', ')
                : 'No se han seleccionado.',
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getSelectedSnacks() {
    List<Map<String, dynamic>> selectedSnacks = [];

    int totalIndex = 0;
    for (String category in _categories) {
      List<double> prices = _snackPrices[category]!;

      for (int i = 0; i < prices.length; i++) {
        if ((_snackQuantities[totalIndex] ?? 0) > 0) {
          selectedSnacks.add({
            'name': '$category ${i + 1}',
            'quantity': _snackQuantities[totalIndex],
            'price': prices[i],
          });
        }
        totalIndex++;
      }
    }

    return selectedSnacks;
  }

  Widget _buildExpansionTile(String category) {
    List<String> images = _snackImages[category]!;
    List<double> prices = _snackPrices[category]!;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          category,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
              crossAxisSpacing: 1,
              mainAxisSpacing: 5,
            ),
            itemCount: images.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              int relativeIndex =
                  _getRelativeIndex(_categories.indexOf(category), index);

              return _buildSnackCard(
                imagePath: images[index],
                price: prices[index],
                index: relativeIndex,
              );
            },
          ),
        ],
      ),
    );
  }

  int _getRelativeIndex(int categoryIndex, int itemIndex) {
    int relativeIndex = 0;
    for (int i = 0; i < categoryIndex; i++) {
      relativeIndex += _snackImages[_categories[i]]!.length;
    }
    return relativeIndex + itemIndex;
  }

  Widget _buildSnackCard({
    required String imagePath,
    required double price,
    required int index,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 130,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'S/. ${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _snackQuantities[index] =
                        (_snackQuantities[index] ?? 0) - 1;
                    if (_snackQuantities[index]! < 0) {
                      _snackQuantities[index] = 0;
                    } else {
                      _totalSnacks -= price;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              Text(_snackQuantities[index]?.toString() ?? '0'),
              IconButton(
                onPressed: () {
                  setState(() {
                    _snackQuantities[index] =
                        (_snackQuantities[index] ?? 0) + 1;
                    _totalSnacks += price;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
