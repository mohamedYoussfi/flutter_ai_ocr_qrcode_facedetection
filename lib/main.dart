/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'package:flutter/material.dart';
import 'package:ocr_app/pages/face.detector.page.dart';
import 'package:ocr_app/pages/home.page.dart';
import 'package:ocr_app/pages/ocr.page.dart';
import 'package:ocr_app/pages/qr.code.page.dart';
import 'package:ocr_app/pages/qr.scan.page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      routes: {
        "/":(context)=>const HomePage(),
        "/ocr":(context)=>const OcrPage(),
        "/face":(context)=>const FaceDetectorPage(),
        "/QR":(context)=>const QRCodePage(),
        "/scanQR": (context)=> const QRViewScannerPage()
      },
    );
  }
}





