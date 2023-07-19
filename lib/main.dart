import 'package:departure/views/scrrens/ditail_page.dart';
import 'package:departure/views/scrrens/home_page.dart';
import 'package:departure/views/scrrens/shloks_page.dart';
import 'package:departure/views/scrrens/splash_scrren.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    app(),
  );
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => home_page(),
        'splash_screen': (context) => sp_scrren(),
        'shloks_page': (context) => shlok_page(),
        'shlok': (context) => shlok(),
      },
    );
  }
}
