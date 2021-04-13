import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klock/clock_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FlatButton buildFlatButton(String title, String imageName) {
    return FlatButton(onPressed: () {}, child: Column(
            children: [
              Image.asset('assets/$imageName.png', scale: 1.5),
              SizedBox(height: 5),
              Text('$title', style: TextStyle(color: Colors.white, fontFamily: 'avenir'), ),
            ]
          ));
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    var offSetSign = '';
    if (!timeZoneString.startsWith('-')) offSetSign = '+';
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            buildFlatButton('Klock', 'clock_icon'),
            SizedBox(height: 20),
            buildFlatButton('add alarm', 'add_alarm'),
            SizedBox(height: 20),
            buildFlatButton('alarm', 'alarm_icon'),
            SizedBox(height: 20),
            buildFlatButton('stopwatch', 'stopwatch_icon'),
            SizedBox(height: 20),
            buildFlatButton('timer', 'timer_icon'),
          ],),
          VerticalDivider(color: Colors.white,),
          Expanded(
                      child: Container(
              padding: EdgeInsets.all(60),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('klock', style: TextStyle(color: Colors.white, fontSize: 24),),
                  SizedBox(height: 40),
                  Text(formattedTime, style: TextStyle(color: Colors.white, fontSize: 64),),
                  Text(formattedDate, style: TextStyle(color: Colors.white, fontSize: 20),),
                  ClockView(),
                  Text('timezone', style: TextStyle(color: Colors.white, fontSize: 24,),),
                  SizedBox(height: 16),
                  Row(children: [
                    Icon(Icons.language, color: Colors.white),
                    SizedBox(width: 6),
                    Text('UTC' + ' ' + offSetSign + timeZoneString, style: TextStyle(color: Colors.white, fontSize: 20,),),
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
