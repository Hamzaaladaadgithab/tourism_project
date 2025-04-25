import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSommer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Filtrele',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text(
                      'YAZ GEZİLERİ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Sadece Yaz Mevsiminde Geziler Göster!'),
                    value: _isInSommer,
                    activeColor: Colors.blue, // Buton açıkken rengi
                    onChanged: (newValue) {
                      setState(() {
                        _isInSommer = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'KIŞ GEZİLERİ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Sadece Kış Mevsiminde Geziler Göster!'),
                    value: _isInWinter,
                    activeColor: Colors.blue,
                    onChanged: (newValue) {
                      setState(() {
                        _isInWinter = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text(
                      'AİLE İÇİN',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Sadece Aileye Uygun Geziler Göster!'),
                    value: _isForFamily,
                    activeColor: Colors.blue,
                    onChanged: (newValue) {
                      setState(() {
                        _isForFamily = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
