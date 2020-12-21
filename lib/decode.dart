import 'enc_dec_func.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';

class Decode extends StatefulWidget {
  @override
  _DecodeState createState() => _DecodeState();
}

class _DecodeState extends State<Decode> {
  String topheading = "Decryptor";
  final TextEditingController enctextcont = new TextEditingController();
  final TextEditingController dectextcont = new TextEditingController();

  @override
  void dispose() {
    enctextcont.dispose();
    dectextcont.dispose();
    super.dispose();
  }

  void deccryptEncryptText(String text) {
    var temp = present(text) == false ? false : getencrypter(text);
    if (temp == false) {
      text = "";
    } else {
      text = decryp(temp);
    }
    setState(() {
      dectextcont.text = text;
    });
  }

  Widget _decodebody() {
    return Material(
      child: new Stack(
        fit: StackFit.expand,
        children: [
          // Image
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
                topheading,
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
              // Input Data
              Container(
                margin: EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
                child: new Column(
                  children: [
                    // input
                    new TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter The Encrypted Code Here",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      controller: enctextcont,
                    ),
                    // Button to decrypt
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: new RaisedButton(
                          child: Text(
                            "Decrypt The Text",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.red,
                          splashColor: Colors.teal,
                          onPressed: () =>
                              deccryptEncryptText(enctextcont.text),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Image(
                  image: AssetImage("decrypt.jpg"),
                  height: 250.0,
                  width: 600.0,
                ),
              ),
              // Output Data
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: new Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "Your Decrypted Text",
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
                              '${dectextcont.text}',
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
                              await FlutterClipboard.copy(
                                  '${dectextcont.text}');
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
    return _decodebody();
  }
}
