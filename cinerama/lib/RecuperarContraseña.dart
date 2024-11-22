import 'package:flutter/material.dart';

class RecuperarContrasenia extends StatelessWidget {
  const RecuperarContrasenia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajustar el padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingresa tu correo electrónico para recibir instrucciones de recuperación de contraseña.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20), // Espacio entre el texto y el campo
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 14), // Tamaño de letra pequeño
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Acción para enviar solicitud de recuperación
                },
                child: const Text(
                  'Enviar solicitud',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
