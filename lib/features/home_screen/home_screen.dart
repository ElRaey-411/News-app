import 'package:flutter/material.dart';
import 'package:news_app/features/home_screen/custom_drawer.dart';
import 'package:news_app/features/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  var provider =  Provider.of<HomeProvider>(context);
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
        title: Text(provider.title),
      ),
      drawer: Drawer(child: CustomDrawer()),
      body: provider.tabs[provider.selectedTab],
    );
  }
}
