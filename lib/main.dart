import 'package:flutter/material.dart';
import 'package:project_api_list/ui/hoaxes_screen.dart';
import 'package:project_api_list/ui/hospitals_screen.dart';
import 'package:project_api_list/ui/main_screen.dart';
import 'package:project_api_list/ui/news_screen.dart';
import 'package:project_api_list/ui/stats_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/hoaxes' :(context)=> HoaxesScreen(),
        '/hospitals' :(context)=> HospitalsScreen(),
        '/news' :(context)=> NewsScreen(),
        '/stats' :(context)=> StatsScreen(),
      },
    );
  }
}