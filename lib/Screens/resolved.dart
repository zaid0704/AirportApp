import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class Resolved extends StatefulWidget {
  Resolved({Key key}) : super(key: key);

  @override
  _ResolvedState createState() => _ResolvedState();
}

class _ResolvedState extends State<Resolved> {
  String cameraResult;
  Future _scan()async{
    cameraResult =await scanner.scan();
  }
  void initState() { 
    super.initState();
    _scan();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraResult == null ? Navigator.of(context).pop()
      :Text('Resolved'),
    );
  }
}