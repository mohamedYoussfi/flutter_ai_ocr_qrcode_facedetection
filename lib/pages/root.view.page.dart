import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app/bloc/theme.bloc.dart';
import 'package:ocr_app/pages/qr.code.page.dart';
import 'package:ocr_app/pages/qr.scan.page.dart';

import 'face.detector.page.dart';
import 'git.users.page.dart';
import 'graphics.page.dart';
import 'home.page.dart';
import 'ocr.page.dart';
class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state){
          return MaterialApp(
            theme: state.theme,
            routes: {
              "/":(context)=>const HomePage(),
              "/ocr":(context)=>const OcrPage(),
              "/face":(context)=>const FaceDetectorPage(),
              "/QR":(context)=>const QRCodePage(),
              "/scanQR": (context)=> const QRViewScannerPage(),
              "/graphics": (context)=> const GraphicsPage(),
              "/users": (context)=> const GitUsersPage()
            },
          );
        }
    );
  }
}
