import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchX extends StatefulWidget {
  const StopwatchX({super.key});

  @override
  State<StopwatchX> createState() => _StopwatchXState();
}

class _StopwatchXState extends State<StopwatchX> {
  Timer? _timer;
  int _elapsTime = 0; //time in millisecond
  bool _isRunning = false;
  List<String> _laps = [];

  void _startStopTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          _elapsTime += 100;
        });

        print(_elapsTime);
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _elapsTime = 0;
      _laps.clear();
    });
  }

  void _recordLaps() {
    setState(() {
      _laps.add(_formatTime(_elapsTime));
    });
    print("========================================================$_laps");
  }

  String _formatTime(int milliSecond) {
    int hundreds = (milliSecond / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr.$hundredsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _formatTime(_elapsTime),
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _recordLaps,
                  child: Container(
                    child: Center(
                      child: Text("Laps"),
                    ),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                GestureDetector(
                  onTap: _resetTimer,
                  child: Container(
                    child: Center(
                      child: Text("Reset"),
                    ),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                GestureDetector(
                  onTap: _startStopTimer,
                  child: Container(
                    child: Center(
                      child: _isRunning ? Text("Stop") : Text("Start"),
                    ),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: _isRunning ? Colors.red : Colors.green,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Text(
                      _laps[index].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
