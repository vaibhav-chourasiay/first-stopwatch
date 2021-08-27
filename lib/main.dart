import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stopwatch/stopwatchscreen.dart';
import 'package:stopwatch/utilits/stopwatch.dart';

void main() {
  runApp(MaterialApp(
    title: "StopWatch",
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: GoogleFonts.lato().fontFamily,
    ),
    home: StopWatchScreen(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  StopWatchClock ob = StopWatchClock(seconds: 0, hour: 0, min: 0);
  var i = true;

  void fun() {
    if (ob.seconds! < 60) {
      ob.secondsValue();
    } else if (ob.seconds! >= 60) {
      ob.secondsValue();
      ob.minValue();
    } else if (ob.min! > 60) {
      ob.secondsValue();
      ob.minValue();
      ob.hourValue();
    }
  }

  stopClock() {
    i = !i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StopWatch"),
      ),
      body: Column(
        children: [
          Text("second: ${ob.seconds}"),
          Text("min: ${ob.min}"),
          Text("hour : ${ob.hour}"),
          TextButton(
            onPressed: () async {
              while (i == true) {
                print("befor ${ob.seconds},${ob.min},${ob.hour}");
                await Future.delayed(Duration(seconds: 1), () {
                  fun();
                  print("after=> ${ob.seconds},${ob.min},${ob.hour}");
                  setState(() {});

                  print("click");
                });
              }
            },
            child: Text("Run"),
          ),
          TextButton(
            onPressed: () {
              stopClock();
            },
            child: Text("stop"),
          ),
          TextButton(
            onPressed: () {
              ob.restartClock();
              setState(() {});
            },
            child: Text("restart"),
          ),
        ],
      ),
    );
  }
}
