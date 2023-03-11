import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class QrScanner extends StatefulWidget {
  String paymentData;
  QrScanner({super.key, required this.paymentData});
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  

  // final databaseReference = FirebaseDatabase.instance.reference();

  // Future<void> sendPaymentDataToFirebase() async {
  //   // TODO: Implement your logic to send payment data to Firebase Realtime Database
  //   // Example:
  //   databaseReference.child('payments').push().set({'data': paymentData});
  //   print('Payment data sent to Firebase Realtime Database');
  // }

  // void generateQrScanner() {
  //   // TODO: Implement your logic to generate QR code based on payment data
  //   // Example:
  //   setState(() {
  //     paymentData = widget.transitionId;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     // sendPaymentDataToFirebase();
            //     // generateQrScanner();
            //   },
            //   child: Text('Pay'),
            // ),
            const SizedBox(height: 20),
            // paymentData.isNotEmpty
            //     ? 
                QrImage(
                    data: widget.paymentData,
                    version: QrVersions.auto,
                    size: 200.0,
                  )
                // : SizedBox(),
          ],
        ),
      ),
    );
  }
}
