/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app/bloc/repositories.bloc.dart';
import 'package:ocr_app/bloc/theme.bloc.dart';
import 'package:ocr_app/bloc/users.bloc.dart';
import 'package:ocr_app/pages/git.users.page.dart';
import 'package:ocr_app/pages/graphics.page.dart';
import 'package:ocr_app/pages/face.detector.page.dart';
import 'package:ocr_app/pages/home.page.dart';
import 'package:ocr_app/pages/ocr.page.dart';
import 'package:ocr_app/pages/qr.code.page.dart';
import 'package:ocr_app/pages/qr.scan.page.dart';
import 'package:ocr_app/pages/root.view.page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>UsersBloc(),),
        BlocProvider(create: (context)=>RepositoriesBloc(),),
        BlocProvider(create: (context)=>ThemeBloc(),),
      ],
      child: const RootView()
    );
  }
}





