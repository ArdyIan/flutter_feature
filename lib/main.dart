import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ButtonPage(),
  ));
}

bool toogle = true;

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 350),
        reverseDuration: Duration(milliseconds: 275));

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    super.dispose();
  }

  Alignment alignment1 = Alignment(0.0, 0.0);
  Alignment alignment2 = Alignment(0.0, 0.0);
  Alignment alignment3 = Alignment(0.0, 0.0);
  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          height: 250.0,
          width: 250.0,
          child: Stack(
            children: [
              AnimatedAlign(
                duration: toogle
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment1,
                curve: toogle ? Curves.easeIn : Curves.elasticOut,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toogle ? Curves.easeIn : Curves.easeOut,
                  height: size1,
                  width: size1,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              ),
              AnimatedAlign(
                duration: toogle
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment2,
                curve: toogle ? Curves.easeIn : Curves.elasticOut,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toogle ? Curves.easeIn : Curves.easeOut,
                  height: size2,
                  width: size2,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              ),
              AnimatedAlign(
                duration: toogle
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment3,
                curve: toogle ? Curves.easeIn : Curves.elasticOut,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toogle ? Curves.easeIn : Curves.easeOut,
                  height: size3,
                  width: size3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: _animation.value * pi * (3 / 4),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 375),
                    curve: Curves.easeOut,
                    height: toogle ? 70.0 : 60.0,
                    width: toogle ? 70.0 : 60.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        borderRadius: BorderRadius.circular(60.0)),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        splashColor: Colors.black54,
                        splashRadius: 31.0,
                        onPressed: () {
                          setState(() {
                            if (toogle) {
                              toogle = !toogle;
                              _controller.forward();
                              Future.delayed(Duration(milliseconds: 10), () {
                                alignment1 = Alignment(-0.5, -0.3);
                                size1 = 50.0;
                              });
                              Future.delayed(Duration(milliseconds: 100), () {
                                alignment2 = Alignment(0.0, -0.5);
                                size2 = 50.0;
                              });
                              Future.delayed(Duration(milliseconds: 200), () {
                                alignment3 = Alignment(0.5, -0.3);
                                size3 = 50.0;
                              });
                            } else {
                              toogle = !toogle;
                              _controller.reverse();
                              alignment1 = Alignment(0.0, 0.0);
                              alignment2 = Alignment(0.0, 0.0);
                              alignment3 = Alignment(0.0, 0.0);
                              size1 = size2 = size3 = 20.0;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
