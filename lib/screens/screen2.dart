import 'package:flutter/material.dart';
import 'package:fwear_assignment/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';

import 'package:vector_math/vector_math_64.dart' as math;

class Screen2 extends StatelessWidget {
  final onTapBack;
  Screen2({this.onTapBack});

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: backgroundColor,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    padding: EdgeInsets.only(
                        top: 25, bottom: 20, left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bookshelf",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: mediaHeight * .035,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Morning On The Banks Of The Seine",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: mediaHeight * .025,
                              fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Read 49%",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: mediaHeight * .02,
                                    fontWeight: FontWeight.bold)),
                            Radial_Progress(
                              goalCompleted: .49,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: mediaHeight / 4,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 10)
                                  ],
                                  image: DecorationImage(
                                      image: popularBooks[index].coverPhoto,
                                      fit: BoxFit.fill),
                                ),
                              );
                            },
                            itemCount: popularBooks.length,
                            viewportFraction: .3,
                            scale: .1,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Love Like A Midnight Whistle",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: mediaHeight * .025,
                              fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Read 80%",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: mediaHeight * .02,
                                    fontWeight: FontWeight.bold)),
                            Radial_Progress(
                              goalCompleted: .8,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: mediaHeight / 4,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 10)
                                  ],
                                  image: DecorationImage(
                                      image: popularBooks[index].coverPhoto,
                                      fit: BoxFit.fill),
                                ),
                              );
                            },
                            itemCount: popularBooks.length,
                            viewportFraction: .3,
                            scale: .1,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 25),
            child: Container(
              height: 40,
              width: 40,
              color: Colors.white,
              child: IconButton(
                onPressed: onTapBack,
                icon: Icon(Icons.arrow_back),
              ),
            ),
          )
        ],
      ),
      color: Colors.white,
    );
  }
}

class Radial_Progress extends StatefulWidget {
  final double goalCompleted;
  Radial_Progress({this.goalCompleted});

  @override
  _Radial_ProgressState createState() => _Radial_ProgressState();
}

class _Radial_ProgressState extends State<Radial_Progress>
    with SingleTickerProviderStateMixin {
  AnimationController radialProgressanimation_controller;
  Animation<double> progress_animation;
  double progress_degree = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radialProgressanimation_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    progress_animation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: radialProgressanimation_controller, curve: Curves.decelerate))
      ..addListener(() {
        setState(() {
          progress_degree = widget.goalCompleted * progress_animation.value;
        });
      });
    radialProgressanimation_controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    radialProgressanimation_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 20,
        width: 20,
      ),
      painter: RadialPainter(radial_progress_paint: progress_degree),
    );
  }
}

class RadialPainter extends CustomPainter {
  double radial_progress_paint;
  RadialPainter({this.radial_progress_paint});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progress_paint = Paint()
      ..shader = LinearGradient(colors: [
        Colors.red,
        Colors.deepOrangeAccent,
        Colors.orangeAccent,
        Colors.amber
      ]).createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(radial_progress_paint),
        false,
        progress_paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
