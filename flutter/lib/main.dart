import 'package:e_commerce/providers/provider.dart';
import 'package:e_commerce/repositories/repository.dart';
import 'package:e_commerce/view/homePageContent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(EShop());
}

class EShop extends StatelessWidget {
  const EShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CategoryRepository>(
          create: (context) => CategoryRepository(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider(
                categoryRepository: context.read<CategoryRepository>())
              ..fetchCategories())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageContent(),
        theme: ThemeData(
          // appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
