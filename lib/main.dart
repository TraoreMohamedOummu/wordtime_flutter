import 'package:flutter/material.dart';
import 'package:wordtime/pages/choose.dart';
import 'package:wordtime/pages/home.dart';
import 'package:wordtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const Choose()
    },
  ));
}
