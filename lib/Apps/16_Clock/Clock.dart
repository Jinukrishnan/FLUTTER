import 'package:flutter/material.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer? _timer;
  DateTime _currentTime = DateTime.now();
  String? _formateTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTime();
  }

  void _startTime() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
        _formateTime =
            '${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')}:${_currentTime.millisecond.toString().padLeft(2, '0')}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_formateTime.toString()),
      ),
    );
  }
}
