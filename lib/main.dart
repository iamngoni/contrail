import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/map_screen.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const ContrailApp());
}

class ContrailApp extends StatelessWidget {
  const ContrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contrail',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const MapScreen(),
    );
  }
}
