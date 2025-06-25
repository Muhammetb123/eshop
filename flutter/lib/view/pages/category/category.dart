import 'package:e_commerce/providers/provider.dart';
import 'package:e_commerce/widgets/build_subcategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Category"),
          ),
          body: ListView(
            children: [
              ExpansionTile(
                title: Text("Еда"),
                leading: Icon(Icons.apple),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Консервированная продукция"),
                  BuildSubCategory(title: "Хлеб и кондитерское изделия"),
                  BuildSubCategory(title: "Растительные масла"),
                  BuildSubCategory(title: "Сухофрукты, семечки"),
                  BuildSubCategory(title: "Ароматизаторы"),
                  BuildSubCategory(title: "Зерно и зерновые продукты"),
                  BuildSubCategory(title: "Для кухни"),
                  BuildSubCategory(title: "Салат"),
                ],
              ),
              ExpansionTile(
                title: Text("Безаолкогольные напитки"),
                leading: Icon(Icons.local_drink),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Чистая вода"),
                  BuildSubCategory(title: "Газированные напитки"),
                  BuildSubCategory(title: "Энергетические напитки"),
                  BuildSubCategory(title: "Фруктовые, соки"),
                  BuildSubCategory(title: "Чай"),
                  BuildSubCategory(title: "Кофе"),
                  BuildSubCategory(title: "Холодный чай, компот"),
                  BuildSubCategory(title: "Кисель"),
                ],
              ),
              ExpansionTile(
                title: Text("Молочные продукты"),
                leading: Image.asset("assets/images/milkshake-in-hand.jpg"),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Молочные продукты и йогурты"),
                  BuildSubCategory(title: "Яйцо"),
                  BuildSubCategory(title: "Мороженое"),
                  BuildSubCategory(title: "Сыры и изделия из масло"),
                  BuildSubCategory(title: "Творожная продукция"),
                  BuildSubCategory(title: "Крем шоколад и сгущенное молоко"),
                ],
              ),
              ExpansionTile(
                title: Text("Мясо и куриная продукция"),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Куриные продукты"),
                  BuildSubCategory(title: "Колбасные продукты"),
                  BuildSubCategory(title: "Рыба"),
                ],
              ),
              ExpansionTile(
                title: Text("Средство для детей"),
                leading: Icon(Icons.child_care),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Дутское питание"),
                  BuildSubCategory(title: "Товары для ухода за ребенком"),
                  BuildSubCategory(
                      title: "Детские аксессуары и товары для кормление"),
                  BuildSubCategory(title: "Детские игрушки"),
                ],
              ),
              ExpansionTile(
                title: Text("Чистящие химикаты"),
                leading: Icon(Icons.soap),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Стиральные порошки"),
                  BuildSubCategory(
                      title: "Моющие средства длякухни и мытя посуды"),
                  BuildSubCategory(title: "Бытовые чистящие и моющие средства"),
                  BuildSubCategory(title: "Бумажное полотенца"),
                  BuildSubCategory(title: "Средства по уходу за обувью"),
                ],
              ),
              ExpansionTile(
                title: Text("Товары для дома"),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Кухонные принадлежности]"),
                  BuildSubCategory(title: "Хозяйственные товары"),
                ],
              ),
              ExpansionTile(
                title: Text("Косметика и средства личной гигиены"),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                  BuildSubCategory(title: "Уход за волосамы"),
                  BuildSubCategory(title: "Средство по уходу за кожей"),
                  BuildSubCategory(title: "Женская гигиена"),
                  BuildSubCategory(title: "Мужская гигена"),
                  BuildSubCategory(title: "Здаровье и гигиена зубов"),
                  BuildSubCategory(title: "Влажные салфетки"),
                  BuildSubCategory(title: "Ватные палочки и диски"),
                  BuildSubCategory(title: "Уход за лицом"),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.book),
                title: Text("Школьные и офисные принадлежности"),
                children: [
                  BuildSubCategory(title: "Все товары категории"),
                ],
              ),
              ExpansionTile(title: Consumer<CategoryProvider>(
                builder: (context, categoryProvider, child) {
                  return Text(categoryProvider.categories
                      .map((category) => category.name)
                      .join(', '));
                },
              ))
            ],
          )),
    );
  }
}
