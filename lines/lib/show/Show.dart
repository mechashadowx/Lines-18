import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lines/helper.dart';

class Show extends StatefulWidget {
  final Pair info;

  Show({
    this.info,
  });

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  double up, fullSize, opacity;
  int full, now, duration;

  @override
  void initState() {
    super.initState();
    up = fullSize = 0.0;
    opacity = 1;
    full = now = 0;
    String temp = '';
    for (int i = 0; i < widget.info.lines.length; i++) {
      if (widget.info.lines[i] != ',') {
        temp += widget.info.lines[i];
      }
    }
    for (int i = 0; i < temp.length; i++) {
      full = full * 10 + (temp.codeUnitAt(i) - 48);
    }
    if (full <= 10000000) {
      duration = full ~/ 1000000;
    } else if (full <= 100000000) {
      duration = full ~/ 10000000;
    } else if (full <= 1000000000) {
      duration = full ~/ 100000000;
    } else if (full <= 10000000000) {
      duration = full ~/ 1000000000;
    } else if (full <= 100000000000) {
      duration = full ~/ 10000000000;
    } else {
      duration = full ~/ 100000000000;
    }
    if (duration == 0) {
      duration = 1;
    }
    if (full <= 10000000) {
      up = 0.16 * 1;
    } else if (full <= 100000000) {
      up = 0.16 * 2;
    } else if (full <= 1000000000) {
      up = 0.16 * 3;
    } else if (full <= 10000000000) {
      up = 0.16 * 4;
    } else if (full <= 100000000000) {
      up = 0.16 * 5;
    } else {
      up = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: blackBlue,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
              data.size.width * 0.1,
              data.size.height * 0.05,
              data.size.width * 0.1,
              0.0,
            ),
            // child: Center(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: data.size.height * 0.15,
                      child: AutoSizeText(
                        widget.info.title,
                        style: TextStyle(
                          color: cyan,
                          fontSize: data.size.width * 0.18,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: data.size.height * 0.1,
                              child: Center(
                                child: Text(
                                  widget.info.lines,
                                  style: TextStyle(
                                    color: cyan,
                                    fontSize: data.size.width * 0.1,
                                  ),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: duration),
                              height: fullSize,
                              width: data.size.width * 0.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: purple,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                opacity = 0.0;
                now = full;
                fullSize = data.size.height * 0.7 * up;
              });
            },
            child: Opacity(
              opacity: opacity,
              child: Container(
                child: Center(
                  child: Image.asset(
                    'images/GO.png',
                    height: data.size.width * 0.3,
                    width: data.size.width * 0.3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
