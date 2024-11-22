import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

class MetodoPago extends StatefulWidget {
  final List<Map<String, dynamic>> selectedSnacks;
  final List<String> selectedSeats;
  final double total;

  const MetodoPago({
    super.key,
    required this.selectedSnacks,
    required this.selectedSeats,
    required this.total,
  });

  @override
  _MetodoPagoState createState() => _MetodoPagoState();
}

class _MetodoPagoState extends State<MetodoPago> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  bool isCardSelected = false;
  bool isYapeSelected = false;
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total a pagar: S/${widget.total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Resumen de tu compra:',
              style: const TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount:
                    widget.selectedSnacks.length + widget.selectedSeats.length,
                itemBuilder: (context, index) {
                  if (index < widget.selectedSnacks.length) {
                    var snack = widget.selectedSnacks[index];
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 255, 196, 0), width: 1),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('${snack['name']} x${snack['quantity']}'),
                        subtitle: Text(
                            'S/${(snack['price'] * snack['quantity']).toStringAsFixed(2)}'),
                      ),
                    );
                  } else {
                    int seatIndex = index - widget.selectedSnacks.length;
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 0, 196, 0), width: 1),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title:
                            Text('Butaca: ${widget.selectedSeats[seatIndex]}'),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Seleccione un método de pago:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Checkbox(
                  value: isCardSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isCardSelected = value ?? false;
                      isYapeSelected = !isCardSelected;
                    });
                  },
                ),
                const Text('Tarjeta'),
                Checkbox(
                  value: isYapeSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isYapeSelected = value ?? false;
                      isCardSelected = !isYapeSelected;
                    });
                  },
                ),
                const Text('Yape'),
              ],
            ),
            if (isCardSelected) ...[
              TextField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Número de tarjeta',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _expiryDateController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de vencimiento (MM/AA)',
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextField(
                controller: _cvvController,
                decoration: const InputDecoration(
                  labelText: 'CVV',
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ],
            const SizedBox(height: 10),
            CheckboxListTile(
              title: const Text('Aceptar términos y condiciones'),
              value: termsAccepted,
              onChanged: (bool? value) {
                setState(() {
                  termsAccepted = value ?? false;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handlePayment,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Pagar'),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayment() {
    if (!termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Debe aceptar los términos y condiciones para continuar.'),
        ),
      );
      return;
    }

    if (!isCardSelected && !isYapeSelected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seleccione un método de pago.')),
      );
      return;
    }

    _generateReceipt();
  }

  Future<pw.ImageProvider> _loadImage() async {
    final imageBytes = await rootBundle.load('assets/images/icon/logo.png');
    return pw.MemoryImage(imageBytes.buffer.asUint8List());
  }

  Future<void> _generateReceipt() async {
    final paymentMethod = isCardSelected ? 'Tarjeta' : 'Yape';
    final currentDate = DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());

    final qrData = '''
Recibo de compra CINERAMA
Total: S/${widget.total.toStringAsFixed(2)}
Método de pago: $paymentMethod
Fecha y hora: $currentDate
Butacas seleccionadas: ${widget.selectedSeats.join(', ')}
Snacks seleccionados: ${widget.selectedSnacks.map((snack) => '${snack['name']} x${snack['quantity']}').join(', ')}
''';

    final qrCodeImage = await _generateQRCodeImage(qrData);
    final logoImage = await _loadImage();

    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Image(logoImage, height: 100, width: 100),
            pw.SizedBox(height: 20),
            pw.Text('Recibo de Compra - CINERAMA',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 40),
            qrCodeImage,
          ],
        );
      },
    ));

    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }

  Future<pw.Widget> _generateQRCodeImage(String data) async {
    final qrCode = QrPainter(
      data: data,
      version: QrVersions.auto,
      gapless: false,
      color: ui.Color(0xFF000000),
      emptyColor: ui.Color(0xFFFFFFFF),
    );
    final picData = await qrCode.toImageData(200);
    final byteData = picData!.buffer.asUint8List();
    return pw.Image(pw.MemoryImage(byteData));
  }
}
