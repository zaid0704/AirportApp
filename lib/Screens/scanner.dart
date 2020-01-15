import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class Scanner extends StatefulWidget {
  Scanner({Key key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  Future _scan()async{
    String cameraScanResult = await scanner.scan();
    print('Here the resulkt$cameraScanResult');
  }
  void initState() { 
    super.initState();
    _scan();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            

          ],
        ),
      ),
    );
  }
}