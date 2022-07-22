import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/flutter_plugin_scanzy_barcodescanner.dart';

import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_options.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_format.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _barcode = '';

  @override
  void initState() {
    super.initState();
    setScanzyLicense();
  }

  Future<void> setScanzyLicense() async {
    try {
      await ScanzyBarcodescanner.setLicense("lienseKey");
      // ignore: empty_catches
    } on PlatformException {}
  }

  Future<void> scan() async {
    String barcode;
    try {
      const format = [ScanzyBarcodeFormat.code128, ScanzyBarcodeFormat.ean13];
      final options = ScanzyBarcodeOptions(format, true, true, true, true);
      barcode = await ScanzyBarcodescanner.scan(options) ?? '';
    } on PlatformException {
      barcode = '';
    }

    if (!mounted) return;

    setState(() {
      _barcode = barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scanzy Barcode Scanner Flutter Sample'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('scanned barcode: $_barcode\n'),
              TextButton(
                  onPressed: () {
                    scan().then((v) => null);
                  },
                  child: Text('SCAN'))
            ],
          ),
        ),
      ),
    );
  }
}
