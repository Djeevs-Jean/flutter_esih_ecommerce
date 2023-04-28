import 'package:flutter/material.dart';

class NavigationPage1 extends StatefulWidget {
  const NavigationPage1({super.key});

  @override
  State<NavigationPage1> createState() => _NavigationPage1State();
}

class _NavigationPage1State extends State<NavigationPage1> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("NavigationPage 1 NavigationPage1"));
  }
}


class NavigationPage2 extends StatefulWidget {
  const NavigationPage2({super.key});

  @override
  State<NavigationPage2> createState() => _NavigationPage2State();
}

class _NavigationPage2State extends State<NavigationPage2> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("NavigationPage 2 NavigationPage2"));
  }
}
