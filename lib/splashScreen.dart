import 'dart:async';
import 'package:attendease/login.dart';
// import 'package:attendease/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late Animation _animation;
  late AnimationController _animationController;

  var listRadius = [150.0, 200.0, 250.0, 300.0, 350.0];
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 4), lowerBound: 0.2);

    _animation = Tween(begin: 0.0, end: 34.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();

    Timer(Duration(seconds: 4), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'AttendEase')));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.blue.shade600],
              stops: [0.0, 1.0],
            )
        ),
        child: Center(
          child: Stack(
              alignment: Alignment.center,
              children: [
                buildMyContainer(listRadius[0]),
                buildMyContainer(listRadius[1]),
                buildMyContainer(listRadius[2]),
                buildMyContainer(listRadius[3]),
                buildMyContainer(listRadius[4]),
                Text(
                  'AttendEase',
                  style: TextStyle(
                      fontSize: _animation.value, fontWeight: FontWeight.w700, color: Colors.white,),
                ),
              ]
          ),
        ),
      ),
    );
  }

  Widget buildMyContainer(radius){
    return Container(
      width: radius * _animationController.value,
      height: radius * _animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange.withOpacity(1.0 - _animationController.value),
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade100],
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}

