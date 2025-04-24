import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters'; // Static route name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Filtrele',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Title'ı ortalar
      ),
      drawer: AppDrawer(),
      body: const Center(
        child: Text(
          'Bu filtreleme sayfası...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
