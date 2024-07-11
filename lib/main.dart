import 'package:flutter/material.dart';
import 'screens/login_page.dart'; // Pastikan path ini sesuai dengan struktur folder Anda
import 'screens/register_page.dart'; // Pastikan path ini sesuai dengan struktur folder Anda
import 'screens/home_page.dart'; // Pastikan path ini sesuai dengan struktur folder Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(), // Set the initial page to the login page
      routes: {
        '/login': (context) => Login(), // Tambahkan rute untuk halaman login
        '/register': (context) => Register(), // Tambahkan rute untuk halaman registrasi
        '/home': (context) => HomePage(),// Tambahkan rute untuk halaman home
      },
    );
  }
}
