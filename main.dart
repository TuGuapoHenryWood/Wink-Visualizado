import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List pickUpLines = [
    "Well Im here, what about your other 2 wishes",
    "Shouldn't it be illegal to pull off such a stunning look",
    "I apologize in advance for biting you, my guess is you were too attractive... it will happen again",
  ];

  Random randomLine = new Random();

  int pickUpIndex = 0;

  void newLine(){
    setState(() => pickUpIndex = randomLine.nextInt(3),
    );
  }

  List colours = [
    Colors.pink[600],
    Colors.amber[200],
    Colors.brown[800],
  ];

  Random randomColour = new Random();

  int colourIndex = -0;

  void changeColor() {
    if (colourIndex == 2){
      setState(() => colourIndex = -1);
    }
    setState(() => colourIndex++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colours[colourIndex],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("W;nk"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32.5,
          letterSpacing: 1.5,
          color: Colors.white,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_sharp,
                color: Colors.white,
                size: 32.5,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          SizedBox(height: 200),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                pickUpLines[pickUpIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          SizedBox(height: 175),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                      Icons.bookmark_sharp,
                    color: Colors.white,
                    size: 25,
                  ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  changeColor();
                  newLine();
                },
                icon: Icon(
                  Icons.favorite_outline_sharp,
                  color: Colors.white,
                  size: 75,
                ),
                iconSize: 75,
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

