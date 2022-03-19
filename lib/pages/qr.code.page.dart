/// @Author : Mohamed YOUSSFI : med@youssfi.net
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  TextEditingController _controller = TextEditingController();
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QRCode')),
      body: Column(
        children: [
          QrImage(
            data: data,
            size: 200,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.qr_code_2_outlined),
              onPressed: () {}
          )
        ],
      ),
    );
  }
}
