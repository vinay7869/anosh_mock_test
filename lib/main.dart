import 'task/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'task/screen/home/home_screen2.dart';

void main() {
  runApp(const MyApp());
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}
