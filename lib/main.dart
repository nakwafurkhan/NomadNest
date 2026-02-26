import 'package:flutter/material.dart';
// Ensure this path matches your actual file structure
import 'package:nomad_nest/pages/home.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomad Nest',
      debugShowCheckedModeBanner: false, // Cleaner look for development
      theme: ThemeData(
        useMaterial3: true,
        // FIXED: Added 'ColorScheme' before '.fromSeed'
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF004D40), // Deep Teal to match your theme
        ),
      ),
      // FIXED: Ensure this matches the class name in your home.dart
      // If your class in home.dart is 'HomeScreen', change this to HomeScreen()
      home: const HomeScreen(), 
    );
  }
}