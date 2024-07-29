import 'package:flutter/material.dart';
import 'package:page_viewer/pages/page_viewer_example.dart';


void main() => runApp(const PageViewExampleApp());

class PageViewExampleApp extends StatelessWidget {
  const PageViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const PageViewExample(),
      );
  }
}

