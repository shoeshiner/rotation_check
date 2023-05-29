import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotation_check/rotation_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _rotationLock = false;
  final _rotationCheckPlugin = RotationCheck();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    bool rotationLock = false;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _rotationCheckPlugin.getPlatformVersion() ?? 'Unknown platform version';
      rotationLock = await _rotationCheckPlugin.isRotationLocked() ?? false;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _rotationLock = rotationLock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('rotation_check example'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(Icons.rotate_right_outlined, size: 50),
                  const SizedBox(height: 10),
                  Text('Rotation Lock: ${_rotationLock ? '✅' : '❌'}', style: const TextStyle(fontSize: 20)),
                ],
              ),
              TextButton(
                onPressed: () async {
                  await initPlatformState();
                },
                child: const Text('Fetch Manually'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
