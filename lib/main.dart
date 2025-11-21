import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/providers/ConfigProvider.dart';
import 'config/theme_manager.dart';
import 'core/prefs_manager/prefs_manager.dart';
import 'core/resources/routes_manager.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ConfigProvider(),
      child: NewsApp()),);
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.homeScreen,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode:configProvider.currentTheme,
      ),
    );
  }
}