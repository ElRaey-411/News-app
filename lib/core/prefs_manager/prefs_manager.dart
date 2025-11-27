import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager{
 static late SharedPreferences prefs;
 static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
  }
 static const String themeKey='saved_theme';


  static void saveTheme(ThemeMode themeMode) {
    String savedTheme= themeMode==ThemeMode.light? 'light': 'dark' ;
    prefs.setString(themeKey, savedTheme);
  }
  static ThemeMode? getTheme(){
     String? savedTheme = prefs.getString(themeKey);
     if(savedTheme==null){
       return null;
     }
     return savedTheme=='light'?ThemeMode.light:ThemeMode.dark;
  }



}