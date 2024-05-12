// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './pages/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () => runApp(
        ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Ratings',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// API Read Access Token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1N2Q4YjM4NzM2YWIwY2VhMTE2N2E2OTZjY2JiN2RmZCIsInN1YiI6IjY2M2U1ZDI1NjllY2E0ZGE3YjNmOGVmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eVKtkeN2Yomcw1jJMaiqEmvBYLQDgzjZe7ZABEGbwuI"