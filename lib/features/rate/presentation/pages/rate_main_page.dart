import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateMainPage extends StatefulWidget {
  const RateMainPage({super.key});

  @override
  State<RateMainPage> createState() => _RateMainPageState();
}

class _RateMainPageState extends State<RateMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("rate page"),
      ),
    );
  }
}
