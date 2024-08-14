import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as math;

class Compass extends StatefulWidget {
  const Compass({super.key});

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  bool _hasPermission = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPermissionStatus();
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        _hasPermission = (status == PermissionStatus.granted);
        // print(_hasPermission);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      if (_hasPermission) {
        return _buildCompass();
      } else {
        return _buildPermissionSheet();
      }
    }));
  }

  // compass widget
  // Widget _buildCompass() {
  //   return Center(
  //     child: Container(
  //       padding: EdgeInsets.all(20),
  //       child: Image.asset('images/a.jpg'),
  //     ),
  //   );
  // }
  Widget _buildCompass() {
    return StreamBuilder(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          // error msg
          if (snapshot.hasError) {
            return Text("Error Reaing Heading:" + snapshot.error.toString());
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          double? direction = snapshot.data!.heading;
          // if direction in null,then device not support this sensor
          if (direction == null) {
            return Center(
              child: Text("Device Doesn't sensor"),
            );
          }

          return Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Transform.rotate(
                  angle: direction * (math.pi / 180),
                  child: Image.asset('images/a.jpg')),
            ),
          );
        });
  }
  // permission widget

  Widget _buildPermissionSheet() {
    return Center(
      child: ElevatedButton(
        child: Text("Request Permission"),
        onPressed: () {
          Permission.locationWhenInUse.request().then((value) {
            _fetchPermissionStatus();
          });
        },
      ),
    );
  }
}
