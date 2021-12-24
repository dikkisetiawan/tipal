import 'package:flutter/material.dart';
import 'package:tipal/pages/home_page.dart';
import 'package:tipal/pages/tickets_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  // Selected Index of the bottom navigation bar
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomePage(),
    TicketsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Tickets'
          ),
        ],
        selectedItemColor: const Color.fromRGBO(253, 198, 32, 1),
        unselectedItemColor: const Color.fromRGBO(204, 204, 204, 1),
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
      )
    );
  }

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}