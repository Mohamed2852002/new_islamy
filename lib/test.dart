import 'dart:async';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Timer? _timer;
  Duration _duration = Duration();
  
  // Replace with your specific target time
  DateTime _targetTime = DateTime.now().add(Duration(hours: 1)); // 1 hour from now

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    final now = DateTime.now();
    if (_targetTime.isAfter(now)) {
      _duration = _targetTime.difference(now);
    } else {
      _duration = Duration.zero;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration -= Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String hours = twoDigits(duration.inHours);
      String minutes = twoDigits(duration.inMinutes.remainder(60));
      String seconds = twoDigits(duration.inSeconds.remainder(60));
      return "$hours:$minutes:$seconds";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown Timer"),
      ),
      body: Center(
        child: Text(
          _formatDuration(_duration),
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Test(),
  ));
}
