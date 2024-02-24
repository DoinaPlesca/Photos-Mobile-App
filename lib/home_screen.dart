import 'package:flutter/material.dart';
import 'package:photos/app_drawer.dart';

const appTitle = 'Photos';
const appDescription =
    "This small app demonstrates how to navigate between screens and use camera.";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(appTitle, style: textTheme.headlineLarge),
              const Divider(),
              Image.asset('images/teddy.webp'),
              const Spacer(),
              Text(appDescription, style: textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
