import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return
        // 1st  way
        // ----------------------------
        // MaterialApp(
        //   home: Scaffold(
        //     backgroundColor: currentWidth < 600 ? Colors.red : Colors.green,
        //     body: Center(
        //       child: Text(currentWidth.toString()),
        //     ),
        //   ),
        // );
        // second way
        // =======================
        MaterialApp(
      home: ResponsiveLayout(
        desktopBody: desktopBody(),
        mobileBody: mobileBody(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  ResponsiveLayout({required this.desktopBody, required this.mobileBody});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}

class mobileBody extends StatelessWidget {
  const mobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 6,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 200,
              color: Colors.purple,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  color: Colors.purple[200],
                  child: Text("data"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class desktopBody extends StatelessWidget {
  const desktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 6,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        color: Colors.purple[200],
                        child: Text("data"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            color: Colors.purple.shade200,
          )
        ],
      ),
    );
  }
}
