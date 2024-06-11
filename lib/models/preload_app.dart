import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreloadApp extends StatelessWidget {
  const PreloadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: preloadAssets(context, appPresentationAssets),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const ProviderScope(
            child: App(),
          );
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}