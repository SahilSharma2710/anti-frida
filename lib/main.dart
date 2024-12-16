import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('com.example.anti_frida');

  Future<void> _checkFrida() async {
    try {
      final bool result = await platform.invokeMethod('detectFrida');
      if (result) {
        print('Frida detected!');
      } else {
        print('No Frida detected.');
      }
    } on PlatformException catch (e) {
      print("Failed to detect Frida: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Anti-Frida Detection')),
        body: Center(
          child: ElevatedButton(
            onPressed: _checkFrida,
            child: Text('Check for Frida'),
          ),
        ),
      ),
    );
  }
}
