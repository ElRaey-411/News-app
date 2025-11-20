import 'package:flutter/cupertino.dart';

import '../../features/home_screen/home_screen.dart';

abstract class RoutesManager{
static const String homeScreen ="home";


static Map<String,WidgetBuilder> routes ={
  homeScreen:(context)=>HomeScreen(),
};
}