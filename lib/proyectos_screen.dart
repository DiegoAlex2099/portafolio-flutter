import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProyectosScreen extends StatelessWidget {
  const ProyectosScreen({super.key});

  final List<Map<String, String>> proyectos = const [
    {
      'titulo': 'Smart-Pot 🌱',
      'descripcion': 'Dispositivo que convierte cualquier maceta en una maceta inteligente combinando software y hardware.',
      'lenguaje': 'C, UART',
      'ide': 'STM32CubeIDE',
      'tecnologias': 'Microcontrolador STM32, sensor de humedad HL-69, módulo Bluetooth HC-05',
      'github': '',
    },
    {
      'titulo': 'Almacen México',
      'descripcion': 'Sistema que simula los movimientos de una tienda dedicada a venta de ropa y accesorios para la mujer.',
      'lenguaje': 'Java',
      'ide': 'NetBeans',
      'tecnologias': 'Java JDK 17',
      'github': '',
    },
    {
      'titulo': 'Portafolio Flutter',
      'descripcion': 'Aplicación Flutter multiplataforma para mostrar mis proyectos de ingeniería.',
      'lenguaje': 'Dart',
      'ide': 'Android Studio',
      'tecnologias': 'Flutter, Material 3',
      'github': '',
    },
    {
      'titulo': 'Sistema de Banco',
      'descripcion': 'Sistema que simula los trámites de un banco como abrir cuenta, realizar movimientos y generar reportes.',
      'lenguaje': 'Java',
      'ide': 'NetBeans',
      'tecnologias': 'Java JDK 17',
      'github': '',
    },
  ];

  void _abrirEnlace(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('No se pudo abrir el enlace: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Proyectos'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: proyectos.length,
        itemBuilder: (context, index) {
          final proyecto = proyectos[index];
          return Card(
            color: const Color(0xFF6F577E),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ExpansionTile(
              title: Text(
                proyecto['titulo']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(proyecto['descripcion']!),
                      const SizedBox(height: 12),
                      Text('🧠 Lenguaje: ${proyecto['lenguaje']}'),
                      Text('💻 IDE: ${proyecto['ide']}'),
                      Text('🔧 Tecnologías: ${proyecto['tecnologias']}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: proyecto['github']!.isNotEmpty
                            ? () => _abrirEnlace(proyecto['github']!)
                            : null,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.open_in_new, size: 20),
                            SizedBox(width: 8),
                            Text('Ver en GitHub'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
