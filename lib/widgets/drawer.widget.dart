/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app/bloc/theme.bloc.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menus=[
      {"title":"Home", "icon": Icon(Icons.home, color: Theme.of(context).primaryColor,), "route":"/"},
      {"title":"OCR", "icon": Icon(Icons.ac_unit, color: Theme.of(context).primaryColor), "route":"/ocr"},
      {"title":"Face Detector", "icon": Icon(Icons.face, color: Theme.of(context).primaryColor), "route":"/face"},
      {"title":"QR Code Generate", "icon": Icon(Icons.qr_code, color: Theme.of(context).primaryColor), "route":"/QR"},
      {"title":"QR Scan & Generate", "icon": Icon(Icons.qr_code, color: Theme.of(context).primaryColor), "route":"/scanQR"},
      {"title":"Graphics", "icon": Icon(Icons.grading, color: Theme.of(context).primaryColor), "route":"/graphics"},
      {"title":"Github Users", "icon": Icon(Icons.verified_user, color: Theme.of(context).primaryColor), "route":"/users"},
    ];
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Theme.of(context).colorScheme.primary
                      ]
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/profile.jpg"),
                  ),
                  IconButton(onPressed: (){
                    context.read<ThemeBloc>().add(SwitchThemeEvent());
                  }, icon: const Icon(Icons.switch_account))
                ],
              )
          ),
          Expanded(
            child: ListView.separated(
                 separatorBuilder: (_,__){
                   return Divider(color: Theme.of(context).primaryColor,height: 1,);
                 },
                itemCount: menus.length,
                itemBuilder: (_,index){
                  return ListTile(
                    leading: menus[index]['icon'] as Icon,
                    title: Text("${menus[index]['title']}"),
                    onTap: (){
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, "${menus[index]['route']}");
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
