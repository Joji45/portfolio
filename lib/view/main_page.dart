import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/view/about_page.dart';
import 'package:flutter_application_1/view/contact_page.dart';
import 'package:flutter_application_1/view/portfolio_page.dart';
import 'package:flutter_application_1/view/service_page.dart';
// import 'homepage.dart';
// import 'view/about_page.dart';
// import 'view/portfolio_page.dart';
// import 'view/service_page.dart';
// import 'view/contact_page.dart';
// import 'custom_bottom_bar.dart';

class MainScaffold extends StatefulWidget {
  final int initialIndex;
  const MainScaffold({super.key, this.initialIndex = 0});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int _selectedIndex;

  final List<Widget> _pages = const [
    Home_Page(),
    About_page(),
    PortfolioPage(),
    ServicePage(),
    Contact_page(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth > 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F0),
      body: _pages[_selectedIndex],
      bottomNavigationBar: isWide
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onTabSelected,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color.fromARGB(255, 101, 67, 33),
              unselectedItemColor: Colors.black54,
              backgroundColor: const Color.fromARGB(255, 240, 230, 220),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_3_sharp), label: "About"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.badge_rounded), label: "Portfolio"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Service"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.email), label: "Contact"),
              ],
            ),
      floatingActionButton: isWide
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomBottomBar(
                currentIndex: _selectedIndex,
                onTabSelected: _onTabSelected,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
