/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ocr_app/bloc/theme.bloc.dart';
import 'package:ocr_app/widgets/drawer.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return await showDialog(context:context, builder: (context){
          return AlertDialog(
            title: const Text('Do you want to exit?'),
            actions: [
              ElevatedButton(onPressed: (){
                exit(0);
              }, child: const Text('Exit')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: const Text('Cancel'))
            ],
          );
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(onPressed: (){
              context.read<ThemeBloc>().add(SwitchThemeEvent());
            }, icon: const Icon(Icons.switch_account))
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
