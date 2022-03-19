import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/painter.dart';
class GraphicsPage extends StatefulWidget {
  const GraphicsPage({Key? key}) : super(key: key);
  @override
  State<GraphicsPage> createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> with TickerProviderStateMixin {
  double radius=50;
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController= AnimationController(vsync: this, duration: Duration(seconds: 4));
    Tween<double> tween= Tween(begin: -pi,end: pi);
    animation= tween.animate(animationController)
      ..addListener(() {
        setState(() {
        });})
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          animationController.repeat();
        } else if(status==AnimationStatus.dismissed ){
          animationController.forward();
        }
      })
    ;
    animationController.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphics Animation'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context,snapshot){
                return CustomPaint(
                  painter: ShapePainter(animation.value, radius),
                  child: Container(),
                );
              },
            ),
          ),
          Slider(
              value: radius,
              min: 50,
              max: 300,
              label: radius.toString(),
              divisions: 10,
              onChanged: (value){
                setState(() {
                  radius=value;
                });
              }
          )
        ],
      )
    );
  }
}
