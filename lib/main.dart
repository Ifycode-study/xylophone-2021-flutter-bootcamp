import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

// Upgraded Xylophone (StatefulWidget)

class XylophoneApp extends StatefulWidget {
  //const XylophoneApp({Key? key}) : super(key: key);

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Color myColor = Colors.black;
  int testNum = 0;

  void buttonPlaySound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Expanded coloredKey({int keyNum, Color keyColor, String keyNote}) {
    return Expanded(
      flex: 4,
      child: TextButton(
        onPressed: () {
          buttonPlaySound(keyNum);
          setState(() {
            //1. Make testNum equal to a particular keyNum
            testNum = keyNum;
          });
        },
        style: ButtonStyle(
          //2.a. Return color based on if testNum is to a keyNum
          backgroundColor: MaterialStateProperty.all<Color>(
              testNum == keyNum ? myColor : keyColor),
        ),
        child: Container(
          height: 40.0,
          width: 40.0,
          child: Center(
            child: Text(
              '$keyNote',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            //2.b. Return color based on if testNum is to a keyNum
            color: testNum == keyNum ? keyColor : Colors.grey[900],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              coloredKey(keyNum: 1, keyColor: Colors.red, keyNote: 'd'),
              coloredKey(keyNum: 2, keyColor: Colors.orange, keyNote: 'r'),
              coloredKey(keyNum: 3, keyColor: Colors.yellow, keyNote: 'm'),
              coloredKey(keyNum: 4, keyColor: Colors.green, keyNote: 'f'),
              coloredKey(keyNum: 5, keyColor: Colors.teal, keyNote: 's'),
              coloredKey(keyNum: 6, keyColor: Colors.blue, keyNote: 'l'),
              coloredKey(keyNum: 7, keyColor: Colors.purple, keyNote: 't'),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      //3. Set testNum back to zero (this resets colors)
                      testNum = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('images/refresh.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* Original code (StatelessWidget)


class XylophoneApp extends StatelessWidget {
  void buttonPlaySound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Expanded coloredKey({int keyNum, Color keyColor, String keyNote}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          buttonPlaySound(keyNum);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(keyColor),
        ),
        child: Container(
          height: 40.0,
          width: 40.0,
          child: Center(
            child: Text(
              '$keyNote',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[900],
            //border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              coloredKey(keyNum: 1, keyColor: Colors.red, keyNote: 'd'),
              coloredKey(keyNum: 2, keyColor: Colors.orange, keyNote: 'r'),
              coloredKey(keyNum: 3, keyColor: Colors.yellow, keyNote: 'm'),
              coloredKey(keyNum: 4, keyColor: Colors.green, keyNote: 'f'),
              coloredKey(keyNum: 5, keyColor: Colors.teal, keyNote: 's'),
              coloredKey(keyNum: 6, keyColor: Colors.blue, keyNote: 'l'),
              coloredKey(keyNum: 7, keyColor: Colors.purple, keyNote: 't'),
            ],
          ),
        ),
      ),
    );
  }
}
*/
