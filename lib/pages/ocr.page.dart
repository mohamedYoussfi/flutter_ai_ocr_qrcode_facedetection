/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_app/utils/utils.dart';

class OcrPage extends StatefulWidget {
  const OcrPage({Key? key}) : super(key: key);

  @override
  State<OcrPage> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  bool isLoaded=false;
  late File imageFile;
  String finalText="No Text";
  String imagePath="";
  Utils utils=Utils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: isLoaded?Image.file(imageFile):Text("No IMage"),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: Text("${finalText}"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Source"),
                  content: const Text("Select the source"),
                  actions: [
                    ElevatedButton(
                        onPressed: () async{
                          performOcr(context, ImageSource.camera);
                        },
                        child: const Text("Camera")
                    ),
                    ElevatedButton(
                        onPressed: () async{
                          performOcr(context, ImageSource.gallery);
                        },

                        child: const Text("Gallery")
                    )
                  ],
                );
              }
          );
        },
      ),
    );
  }
  performOcr(context,source) async{
    Navigator.of(context).pop();
    File image=await utils.pickImage(source,false,0);
    File imageCropped= await utils.cropIMage(image);
    setState(() {
      isLoaded=true;
      imageFile=imageCropped;
      print("Image Cropped");
    });
    String content=await utils.textOcr(imageCropped.path);
    setState(() {
      finalText=content;
    });
  }
}