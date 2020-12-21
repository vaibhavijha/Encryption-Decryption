import 'package:flutter/material.dart';
import 'encode.dart';
import 'decode.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String topheading = "CryptoGraphy";

  Widget _bodyWidget() {
    return Material(
      child: new Stack(
        fit: StackFit.expand,
        children: [
          new Image(
            image: new AssetImage("background.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          // Top heading
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Text(
                topheading,
                style: new TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Encryption Button
              new Container(
                margin: const EdgeInsets.all(20.0),
                child: new ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    splashColor: Colors.teal,
                    child: new Text("ENCRYPTION"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Encode()),
                      );
                    },
                  ),
                ),
              ),
              // Decryptio Button
              new Container(
                margin: const EdgeInsets.all(20.0),
                child: new ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    splashColor: Colors.teal,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Decode()),
                      );
                    },
                    child: new Text("DECRYPTION"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _bodyWidget();
  }
}
