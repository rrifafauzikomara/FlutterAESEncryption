import 'package:flutter/material.dart';
import 'package:cipher2/cipher2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AES Encryption',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter AES Encryption'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String plainText = 'Belajar encrypt dan decrypt di Flutter';
  String key = 'xxxxxxxxxxxxxxxx';
  String iv = 'yyyyyyyyyyyyyyyy';
  String encryptedString = '';
  String decryptedString = '';

  encryption() async {
    encryptedString = await Cipher2.encryptAesCbc128Padding7(plainText, key, iv);
  }

  decryption() async {
      decryptedString = await Cipher2.decryptAesCbc128Padding7(encryptedString, key, iv);
  }

  void _encryption() {
    setState(() {
      encryption();
    });
  }

  void _decryption() {
    setState(() {
      decryption();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Hasil Enkripsi:',
                ),
                Text(
                  '$encryptedString',
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Hasil Dekripsi:',
                ),
                Text(
                  '$decryptedString',
                ),
              ],
            ),
            RaisedButton(
              onPressed: _encryption,
              child: Text('Enkrpsi'),
            ),
            RaisedButton(
              onPressed: _decryption,
              child: Text('Dekripsi'),
            ),
          ],
        ),
      ),
    );
  }
}
