import 'package:flutter/material.dart';
import 'package:tipal/theme.dart';
import 'package:tipal/view/pages/home_page.dart';
import 'package:tipal/view/pages/login_page.dart';
import 'package:tipal/view/pages/my_tickets_page.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _selectedNavbar = 0;
  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const MyTicketsPage(),
    const MyTicketsPage(),
    LoginPage()
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedNavbar),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: whiteTextStyle,
        unselectedLabelStyle: greyTextStyle,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
