import 'package:custom_cached_network_image/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NetworkImageExample(),
    );
  }
}

class NetworkImageExample extends StatelessWidget {
  const NetworkImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomCachedNetworkImage(
          imageUrl: "https://picsum.photos/200",
        ),
      ),
    );
  }
}
