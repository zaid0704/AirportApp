import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../handling_data/Auth.dart';
class Scanner extends StatefulWidget {
  Scanner({Key key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String cameraScanResult;
  bool isLoading = true;
  bool once = true;
  bool scanCompleted = false;
  Map<String,dynamic> equipDetails;

  Future _getEquipData(String token)async{
  final http.Response response = await http.get(
      Uri.parse('http://sih2020jss.herokuapp.com/component/743'),
       headers: {
       "Accept":"application/json",
       "Content-Type": "application/json",
       "Authorization": "Bearer $token",
     }
    );
    setState(() {
      isLoading =false;
    });
  // print(json.decode(response.body));
  equipDetails=json.decode(response.body);
  print(equipDetails);


  }

  
  Future _scan()async{
    cameraScanResult = await scanner.scan();
   setState(() {
     cameraScanResult = cameraScanResult;
     scanCompleted = true;
   });
    // print('Here the resulkt$cameraScanResult');
  }
  void initState() { 
    super.initState();
    _scan();
    
  }
  Widget build(BuildContext context) {
     final auth = Provider.of<Auth>(context);
     final token= auth.token;
     if (token!=null &&once&&scanCompleted)
      {
        print('Scan Result is $cameraScanResult');
        _getEquipData(token);
        setState(() {
          once = false;
        });
      }
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: Scaffold(
        backgroundColor: Color(0xFF092D6F) ,
        // body:isLoading?Center(child: CircularProgressIndicator()):
        body:isLoading?Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Center(
              child:  Container(
               width: 82,
               height: 44,
               decoration: BoxDecoration(
                 color: Color(0xFF092D6F),
                 image:DecorationImage(
                   image: AssetImage('assets/logo.png'),
                   fit: BoxFit.cover
                 )
               ),
             
           ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Scanner',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 155,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75),
                topRight: Radius.circular(75))
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index)=>
                Card(
                  margin: const EdgeInsets.only(left:15,right: 15,top: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  color: Color(0xFFE5E5E5),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 150,

                  ),
                ),
              ),
            )
          ],
        ),
        ) 
      ),
    );
  }
}