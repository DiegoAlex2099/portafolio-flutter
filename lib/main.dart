import 'package:flutter/material.dart';
import 'proyectos_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio de Diego',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1B2E),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF2A243F),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              const SizedBox(height: 10),

              // Nombre
              const Text(
                'Diego Castañeda',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Estudiante de Ingeniería en Sistemas',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Fila de íconos + textos
              Wrap(
                spacing: 12,
                alignment: WrapAlignment.center,
                children: const [
                  InfoIcono(icono: Icons.location_on, texto: 'Mexico'),
                  InfoIcono(icono: Icons.smartphone, texto: 'Android Studio'),
                  InfoIcono(icono: Icons.memory, texto: 'STM32'),
                ],
              ),
              const SizedBox(height: 40),

              // Botón
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProyectosScreen()),
                    );
                  },
                  child: const Text(
                    'Ver proyectos',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoIcono extends StatelessWidget {
  final IconData icono;
  final String texto;

  const InfoIcono({super.key, required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, size: 18, color: Colors.purpleAccent),
        const SizedBox(width: 4),
        Text(texto),
      ],
    );
  }
}
