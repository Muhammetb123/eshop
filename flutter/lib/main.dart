import 'package:e_commerce/view/homePageContent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EShop());
}

class EShop extends StatelessWidget {
  const EShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageContent(),
      theme: ThemeData(
        // appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
