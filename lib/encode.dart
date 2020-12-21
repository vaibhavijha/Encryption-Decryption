import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'enc_dec_func.dart';

class Encode extends StatefulWidget {
  @override
  _EncodeState createState() => _EncodeState();
}

class _EncodeState extends State<Encode> {
  final String topheading = "Encrypter";
  final TextEditingController plaintextcont = new TextEditingController();
  final TextEditingController enctextcont =
      new TextEditingController(text: 'Encrypted message');

  @override
  void dispose() {
    plaintextcont.dispose();
    enctextcont.dispose();
    super.dispose();
  }

  void encryptPlainText(String mytext) async {
    final String encoded = encryp(mytext);
    print(encoded);
    setState(() {
      enctextcont.text = encoded;
    });
  }

  Widget _encodebody() {
    return Material(
      child: new Stack(
        fit: StackFit.expand,
        children: [
          // Background
          new Image(
            image: AssetImage("encodebg.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          // Top heading
          Column(
            children: [
              new Text(
                '$topheading',
                style: new TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // input data
              Container(
                margin: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // input
                    new TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter The Text Here",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: plaintextcont,
                    ),
                    // Button to encrypt
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: new RaisedButton(
                          child: Text(
                            "Encrypt The Text",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.red,
                          splashColor: Colors.teal,
                          onPressed: () => encryptPlainText(plaintextcont.text),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Image(
                  image: AssetImage("encrypt.jpg"),
                  fit: BoxFit.cover,
                  height: 250.0,
                  width: 600.0,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              // output data
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: new Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "Your Encrypted Text",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.tealAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Result
                    Container(
                      width: 600.0,
                      height: 50.0,
                      padding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 5.0,
                        left: 5.0,
                        right: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: SelectableText(
                              '${enctextcont.text}',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.content_copy),
                            onPressed: () async {
                              await FlutterClipboard.copy(enctextcont.text);
                            },
                          ),
                        ],
                      ),
                    ),
                    // Button to Go back
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: new RaisedButton(
                          child: Text(
                            "Go back",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.red,
                          splashColor: Colors.teal,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
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
    return _encodebody();
  }
}
