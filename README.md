# scanzy-barcodescanner-sample-flutter

flutter_plugin_scanzy_barcodescanner implements the barcode capture capabilities of the ScanzyBarcodeScannerSDK for iOS and Android. It supports reading a large number of different barcode symbologies, such as Code39, Code93, Code128, Codabar, UPC-A, UPC-E, EAN-8, EAN-13, ITF, QRCode, Aztec, PDF-417, Data Matrix, etc.

## Prerequisites

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
To set up the development environment and learn more about the Dart programming language, follow the official site at [Setup IDE](https://codelabs.developers.google.com/codelabs/flutter-codelab-first#1).

## Installation

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
## Quick Start

To use this plugin in your project, such as lib/main.dart, import the necessary packages:

```dart
import 'package:flutter_plugin_scanzy_barcodescanner/flutter_plugin_scanzy_barcodescanner.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_options.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_format.dart';
import 'package:flutter_plugin_scanzy_barcodescanner/scanzy_barcode_result.dart';
```

First, set the license key you obtained from [Scanzy](https://scanzy.com) for free trial. It's better to do it in your app's startup, although it's fine to call this function every single time a barcode is scanned.

```dart
await ScanzyBarcodeManager.setLicense("your-valid-licensekey");
```

Then, insert the below code snippet into the place where you are scanning barcodes:

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

## API Specification

Below are more details about the parameters:

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
Note: Set only the formats you are interested in. You can add ALL formats, but it would impact performance.


ScanzyBarcodeOptions is defined as:

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
|     Parameter    |   Description         | 
| ------------- |:-------------:| 
| enableVibration      | vibrate your phone when a barcode is detected |
| enableBeep      |   play a beep sound when a barcode is detected    |  
| enableAutoZoom |   the library will zoom in/out automatcially to scan a barcode    |   
| enableScanCropRectOnly |   only scan the view finder area    |   
| formats |   the barcode formats    |  

## Support

If you have any questions or need help, check out our [official website](https://scanzy.com). Get a free trial license. It takes less than one hour to integrate, and it's insanely simple!
