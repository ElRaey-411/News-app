import 'package:flutter/material.dart';
import 'package:news_app/features/home_screen/custom_drawer.dart';
import 'package:news_app/features/home_screen/home_tabs/categories_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ],
        title: Text("Home"),
      ),
      drawer: Drawer(child: CustomDrawer()),
      body: CategoriesTab(),
    );
  }
}
