import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerScreen extends StatelessWidget {
  
  Future<String> scanBarcode() async {
  String barcodeScanRes;
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Optional: Define the scan line color
      'Cancel', // Optional: Define the cancel button text
      true, // Optional: Enable barcode scanning with flash
      ScanMode.DEFAULT, // Specify the scan mode (e.g., QR_CODE, BARCODE)
    );
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }
  return barcodeScanRes;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            scanBarcode().then((String barcode) {
              if (barcode != '-1') {
                // Handle the scanned barcode or QR code
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Scanned Barcode'),
                    content: Text(barcode),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            });
          },
          child: Text('Scan Barcode'),
        ),
      ),
    );
  }
}
