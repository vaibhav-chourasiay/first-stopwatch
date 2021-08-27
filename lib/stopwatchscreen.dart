import 'package:flutter/material.dart';
import 'package:stopwatch/utilits/stopwatch.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  _StopWatchScreenState createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
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
        title: Text(
          "StopWatch",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    " ${(ob.hour! <= 9) ? "0" : ""}${ob.hour} :",
                    style: TextStyle(
                      fontSize: 53.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color:
                        (ob.min! % 2 == 0) ? Colors.greenAccent : Colors.white,
                  ),
                  child: Text(
                    " ${(ob.min! <= 9) ? "0" : ""}${ob.min} :",
                    style: TextStyle(
                      fontSize: 53.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: (ob.seconds! % 2 == 0)
                        ? Colors.black26
                        : Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    " ${(ob.seconds! <= 9) ? "0" : ""}${ob.seconds} ",
                    style: TextStyle(
                      fontSize: 53.0,
                      fontWeight: FontWeight.bold,
                      color:
                          (ob.seconds! % 2 == 0) ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {
                      stopClock();
                    },
                    child: Text(
                      "Stop",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {
                      ob.restartClock();
                      i = true;
                      setState(() {});
                    },
                    child: Text(
                      "Restart",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        elevation: 10.0,
                        onSurface: Colors.black,
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          i = true;

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
        child: Icon(Icons.play_arrow),
        tooltip: "Run StopWatch",
      ),
    );
  }
}
