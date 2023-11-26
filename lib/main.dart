import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathbubble/screen/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      home: const MainMenu()));
}
