import 'package:flutter/cupertino.dart';
import 'package:news_app/features/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../features/home_screen/home_screen.dart';

abstract class RoutesManager{
static const String homeScreen ="home";


static Map<String,WidgetBuilder> routes ={
  homeScreen:(context)=>ChangeNotifierProvider(
    create:(context)=>HomeProvider(),
      child: HomeScreen()),
};
}