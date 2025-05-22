import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/login_decider.dart';
import 'package:gyaanplant_learning_app/providers/course_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => CourseProvider(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
    );
  }
}
