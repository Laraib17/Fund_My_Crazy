import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Actions(actions: , child: ),
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Hello There"),
      ),
      body: Container(
        child: ,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 210, 247, 248),
        ),
      ),
    );
  }
}
