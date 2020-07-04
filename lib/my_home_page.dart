import 'package:flutter/material.dart';
import 'package:fwear_assignment/constant.dart';
import 'package:fwear_assignment/screens/screen1.dart';
import 'package:fwear_assignment/screens/screen2.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var pi = 3.14;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        print(currentPageValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          children: [
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(pi / 2 * (currentPageValue)),
              alignment: FractionalOffset.centerRight,
              child: Screen1(
                onTapBack: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                  controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(pi / 2 * (currentPageValue - 1)),
              alignment: FractionalOffset.centerLeft,
              child: Screen2(
                onTapBack: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                  controller.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
              ),
            )
          ],
        ));
  }
}
