import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  void onClicked() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$count',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                  iconSize: 50,
                  onPressed: onClicked,
                  icon: const Icon(
                    Icons.add_box_rounded,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
