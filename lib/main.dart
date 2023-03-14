import 'package:flutter/material.dart';
import 'package:lendn_app/ui/screens/onboarding_screen.dart';

import 'di/app_initializer.dart';

void main() {

  Future<void> appInitializerInit() async {
    await AppInitializer.initGetIt();
  }

  appInitializerInit();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lendn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const LendnHomePage(title: 'Lendn'),
    );
  }
}

class LendnHomePage extends StatefulWidget {
  const LendnHomePage({super.key, required this.title});

  final String title;

  @override
  State<LendnHomePage> createState() => _LendnHomePageState();
}

class _LendnHomePageState extends State<LendnHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: OnboardingScreen(),
      ),
    );
  }
}
