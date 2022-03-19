/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRViewScannerPage extends StatefulWidget {
  const QRViewScannerPage({Key? key}) : super(key: key);

  @override
  State<QRViewScannerPage> createState() => _QRViewScannerPageState();
}

class _QRViewScannerPageState extends State<QRViewScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController qrViewController;
  Barcode? barcode;
  String? data="Scanned Code";
  bool viewQRScan=false;
  TextEditingController textEditingController=TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingController.text=data!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                qrViewController.flipCamera();
              },
              icon: Icon(Icons.flip))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child:
              (!viewQRScan)?QrImage(data: "${data}"):
              Container(
                padding: EdgeInsets.all(20),
                child: QRView(
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderLength: 20,
                      borderWidth: 20,
                      cutOutSize: MediaQuery.of(context).size.width * 0.8),
                  key: qrKey,
                  onQRViewCreated: (qrViewController) {
                    this.qrViewController = qrViewController;
                    qrViewController.scannedDataStream.listen((barCode) {
                      setState(() {
                        barcode = barCode;
                        data=barCode.code;
                        textEditingController.text=data!;
                        viewQRScan=false;
                      });
                    });
                  },
                ),
              )),
          Expanded(
              flex: 1,
              child:Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                ),

              ))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                viewQRScan=true;
              });
            },
            child: const Icon(Icons.qr_code_2_outlined),
          )
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    qrViewController.dispose();
    super.dispose();
  }
}
