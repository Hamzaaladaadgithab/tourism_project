import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorites_scrren.dart'; 



// bu artık ana sayfamız...

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});



  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    
  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex=index;
      
    });
  }


  int _selectedScreenIndex=0;


  final List<Map<String, dynamic>> _screens=[
     {
      'Screen':CategoriesScreen(),
      'Title':'GEZİ KATEGORİLERİ',

     },
      {
      'Screen': FavoritesScreen(),
      'Title':'GEZİ FAVORİLERİ',
      
     },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(_screens[_selectedScreenIndex]['Title'] as String,
            style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
    ),
     drawer: AppDrawer(),
     
    body:_screens[_selectedScreenIndex]['Screen'] as Widget,

  bottomNavigationBar:BottomNavigationBar(
    onTap: _selectScreen,
    backgroundColor: Colors.blue,
    selectedItemColor: Theme.of(context).colorScheme.secondary,
    unselectedItemColor: Colors.white,
    currentIndex: _selectedScreenIndex,

  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label:'KATEGORİLER',
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label:'FAVORİLER',
    ),

  ],
     ),
    );
  }
}