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
      body: GridView.builder(
        itemCount: 40,
        itemBuilder: (context, index) => const Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("USD"),
              Text("United States Dollar"),
            ],
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
