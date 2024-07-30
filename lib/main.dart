import 'package:flutter/material.dart';
import 'package:page_viewer/pages/page_viewer_example.dart';
import 'package:page_viewer/utlis/color_utiltiy.dart';


void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "PlusJakartaSans",
        scaffoldBackgroundColor:ColorUtility.scaffoldBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUtility.main),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  const PageViewExample(),
      );
  }
}

