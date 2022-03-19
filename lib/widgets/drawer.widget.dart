/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final  menus=const [
    {"title":"Home", "icon": Icon(Icons.home), "route":"/"},
    {"title":"OCR", "icon": Icon(Icons.ac_unit), "route":"/ocr"},
    {"title":"Face Detector", "icon": Icon(Icons.face), "route":"/face"},
    {"title":"QR Code Generate", "icon": Icon(Icons.qr_code), "route":"/QR"},
    {"title":"QR Scan & Generate", "icon": Icon(Icons.qr_code), "route":"/scanQR"},
    {"title":"Graphics", "icon": Icon(Icons.grading), "route":"/graphics"},
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white, Colors.deepOrange
                      ]
                  )
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/profile.jpg"),
                  )
                ],
              )
          ),
          Expanded(
            child: ListView.builder(
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
