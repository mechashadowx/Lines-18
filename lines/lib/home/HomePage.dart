import 'package:flutter/material.dart';
import 'package:lines/helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lines/show/Show.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: purple,
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Container(
              height: data.size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Lines',
                      style: TextStyle(
                        color: cyan,
                        fontSize: data.size.width * 0.25,
                      ),
                    ),
                    Text(
                      'of code',
                      style: TextStyle(
                        color: blackBlue,
                        fontSize: data.size.width * 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: data.size.height * 0.3),
              child: Center(
                child: ListView(
                  children: List.generate(codeBases.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Show(
                              info: codeBases[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: data.size.height * 0.15,
                        margin: EdgeInsets.symmetric(
                          horizontal: data.size.width * 0.2,
                          vertical: data.size.width * 0.1,
                        ),
                        padding: EdgeInsets.all(
                          data.size.width * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: blackBlue,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            codeBases[index].title,
                            style: TextStyle(
                              color: cyan,
                              fontSize: data.size.width * 0.18,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
