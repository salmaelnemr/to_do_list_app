import 'dart:async';
import 'package:flutter/material.dart';
import '../home/ui/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen(),),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF450693),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/To do list-amico.png',
              height: 350,
              width: 400,
            ),
            const Text(
              "To Do List",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

