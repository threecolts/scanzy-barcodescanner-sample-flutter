# scanzy-barcodescanner-sample-flutter

flutter_plugin_scanzy_barcodescanner implements the barcode capture capabilities of the ScanzyBarcodeScannerSDK for iOS and Android. It supports reading a large number of different barcode symbologies, such as Code39, Code93, Code128, Codabar, UPC-A, UPC-E, EAN-8, EAN-13, ITF, QRCode, Aztec, PDF-417, Data Matrix, etc.

## Environment Setup

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
To setup the development environment and learn more about the Dart programming language, follow the official site [Setup IDE](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#1)

## Getting Started

#### Install Scanzy barcode flutter plugin

Add the flutter_plugin_scanzy_barcodescanner plugin to your pubspec.yaml file dependencies:

```yaml
dependencies:
  flutter_plugin_scanzy_barcodescanner: ^0.0.4
```
Then, run this command on your flutter project under the root folder:
```bash
flutter pub get
```
#### Ready to Use

To use this plugin, in your project, such as lib/main.dart, import the necessary packages:

```dart
import 'package:flutter_plugin_scanzy_barcodescanner/flutter_plugin_scanzy_barcodescanner.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_options.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_format.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_result.dart';
```

Firstly, set the license, it's better to do it in your app's startup, although it's fine to call this function every single time to scan the barcode.

```dart
await ScanzyBarcodeManager.setLicense("your-valid-licensekey");
```

Then, insert below code snippet into the place to scan barcode:

```dart

   //support code128, ean13
   const format = [ScanzyBarcodeFormat.code128, ScanzyBarcodeFormat.ean13];
   
  //enableVibration: true
  //enableBeep: true
  //enableAutoZoom: true
  //enableScanCropRectOnly: true
   final options = ScanzyBarcodeOptions(true, true, true, true, format);
   ScanzyBarcodeResult result = await ScanzyBarcodeManager.scan(options);

   print(result.barcode);
   print(result.barcodeType);
```

#### API Model

Below gives you more details about the parameters:

The definition of ScanzyBarcodeFormat:

```dart

enum ScanzyBarcodeFormat {
  none,
  code128,
  code39,
  code93,
  codaBar,
  dataMatrix,
  ean13,
  ean8,
  itf,
  qrCode,
  upca,
  upce,
  pdf417,
  aztec,
  maxiCode
}

```
Note: to set the formats you only interested, although you can add ALL formats, it definitely would impact the performance.


The ScanzyBarcodeOptions is defined as:

```dart
class ScanzyBarcodeOptions {
  bool? enableVibration;
  bool? enableBeep;
  bool? enableAutoZoom;
  bool? enableScanCropRectOnly;
  List<ScanzyBarcodeFormat> formats;

  ScanzyBarcodeOptions(this.enableVibration, this.enableBeep,
      this.autoZoom, this.scanCropRectOnly, this.formats);
}
```
enableVibration: vibrate your phone when barcode detected.<br>

enableBeep: play the beep sound when barcode detected.<br>

enableAutoZoom: the library will zoom in/out automatcially to scan the barcode.<br>

enableScanRectOnly: only scan the view finder area.<br>

formats: the barcode formats.<br>

## Support

if you have any questions or need help, check out our [official website](https://scanzy.com). Get a free trial license to try. It won't take more than one hour to integrate, insanely simple!
