
import 'package:e_commerce/view/accountPage.dart';
import 'package:e_commerce/view/cartPage.dart';
import 'package:e_commerce/view/favoritePage.dart';
import 'package:e_commerce/view/homePage.dart';
import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _MainPageState();
}

class _MainPageState extends State<HomePageContent> {
  final List<Widget> _pages = [
    HomePage(),
    const FavoritePage(),
    const Cartpage(),
    const AccountPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        appBar: AppBar(toolbarHeight: 10),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          selectedFontSize: 5,
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home, color: Colors.white),
            ),

            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.favorite, color: Colors.white),
            ),

            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.account_balance, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
