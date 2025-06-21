import 'package:e_commerce/view/pages/category/category.dart';
import 'package:e_commerce/view/pages/home/components/home_page.dart';
import 'package:e_commerce/view/pages/log%20in/log_in.dart';
import 'package:e_commerce/view/pages/cart/cart_page.dart';
import 'package:e_commerce/view/pages/favorites/favoritePage.dart';
import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _MainPageState();
}

class _MainPageState extends State<HomePageContent> {
  final List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    CategoryPage(),
    Cartpage(),
    AccountPage(),
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
          selectedItemColor: Colors.blue,
          iconSize: 20,
          selectedFontSize: 10,
          // type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          // backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, color: Colors.blue),
              label: "Home",
              icon: Icon(Icons.home, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite, color: Colors.blue),
              label: "Favorite",
              icon: Icon(Icons.favorite, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category, color: Colors.blue),
              label: "Category",
              icon: Icon(Icons.category, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.shopping_cart_outlined, color: Colors.blue),
              label: "Cart",
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.login_rounded, color: Colors.blue),
              label: "Log in",
              icon: Icon(Icons.login_rounded, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
