import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({super.key});

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("news page"),
      ),
    );
  }
}
