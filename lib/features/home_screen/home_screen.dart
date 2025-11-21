import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_drawer.dart';
import 'package:news_app/features/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar:provider.isSearch?null : AppBar(
        actions: [
          Visibility(
            visible: provider.selectedTab==1?true:false,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed:(){
              provider.onSearch();
              }
            )
          ),
        ],
        title: Text(provider.title),
      ),
      drawer: Drawer(child: CustomDrawer()),
      body: provider.tabs[provider.selectedTab],
    );
  }
}
