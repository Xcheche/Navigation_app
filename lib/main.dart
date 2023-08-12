import 'package:flutter/material.dart';
import 'package:navigation_app/art_route.dart';
import 'package:navigation_app/art_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigating Art',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: true,
      ),
      home: ArtRoute(
        art: ArtUtil.IMG_VANGOGH,
      ),
    );
  }
}
