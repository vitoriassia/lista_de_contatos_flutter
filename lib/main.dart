import 'package:interview_gigaservice_flutter/core/services/locator.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App with Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
