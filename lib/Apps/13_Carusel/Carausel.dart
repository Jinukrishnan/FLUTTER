//smooth_page_indicator

import 'package:apps/Apps/13_Carusel/Home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carausel extends StatefulWidget {
  const Carausel({super.key});

  @override
  State<Carausel> createState() => _CarauselState();
}

class _CarauselState extends State<Carausel> {
  PageController _controller = PageController(initialPage: 0);
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              lastPage = (index == 2);
            });
          },
          children: [
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        Container(
          alignment: Alignment(0, .9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Text("Skip"),
                onTap: () {
                  _controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceIn); // Jump to the last page
                },
              ),
              SmoothPageIndicator(controller: _controller, count: 3),
              // set done
              lastPage
                  ? GestureDetector(
                      child: Text("Done"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      },
                    )
                  : GestureDetector(
                      child: Text("Next"),
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    ),
            ],
          ),
        ),
      ],
    ));
  }
}
