import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../handling_data/Auth.dart';
import './MyAppBar.dart';
class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final GlobalKey<FormState> key = GlobalKey();
  TextEditingController partController  = TextEditingController();
  TextEditingController addrController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  bool isreported= false;
  Widget build(BuildContext context) {
  final auth = Provider.of<Auth>(context);
  final userUid = auth.userUid;
  final _token =auth.token;
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: Scaffold(
        appBar: MyAppBar(context),
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Container(
         width: double.infinity,
         height: MediaQuery.of(context).size.height-70,
         //apply dynamic height using app bar height and all
          child:
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30,bottom: 10,top: 30),
                  child: Text('Name of the part',style: TextStyle(color: Color(0xFF474747),fontWeight: FontWeight.bold),),
                )
                
              ],
            ),
         
            Form(
            key: key,
                       
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Padding(
                     padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child:  TextFormField(
                        keyboardType: TextInputType.text,
                        controller: partController,
                        style: TextStyle(fontFamily: 'Quicksand',fontSize: 18,color: Color(0xFF474747) ),
                        
                        validator: (val){
                          if (val.isEmpty )
                           {
                             return 'Invalid part';
                           
                           }
                        },
                      decoration: InputDecoration(
                         filled: true,
                        fillColor: Color.fromRGBO(240, 240, 240, 100),
                       
               
                     hintStyle: TextStyle(color:  Color(0xFF474747),fontFamily: 'Quicksand',fontWeight: FontWeight.bold,),
                      
                        labelStyle: TextStyle(fontFamily: 'Quicksand',fontSize: 14,color: Color(0xFFBBBBBB)),
                        labelText: 'eg. label front tyres',
                        // helperText: 'abc0000@gmail.com',
                        helperStyle: TextStyle(fontFamily: 'Quciksand',color: Colors.yellow),
                      ),
                    ),
                    ),

                     Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30,bottom: 10),
                  child: Text('Relative address',style: TextStyle(color: Color(0xFF474747),fontWeight: FontWeight.bold),),
                )
                
              ],
            ),
                   
                    Padding(
                     padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child:  TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: addrController,
                        style: TextStyle(fontFamily: 'Quicksand',fontSize: 14,color:  Color(0xFF474747)),
                        
                        validator: (val){
                          if (val.isEmpty )
                           {
                             return 'Invalid address';
                           
                           }
                        },
                      decoration: InputDecoration(
                         filled: true,
                        fillColor: Color.fromRGBO(240, 240, 240, 100),
                        
               
                hintStyle: TextStyle(color: Colors.white,fontFamily: 'Quicksand',),
               
                        labelStyle: TextStyle(fontFamily: 'Quicksand',fontSize: 14,color:  Color(0xFFBBBBBB),fontWeight: FontWeight.bold),
                        labelText: 'eg. Aeroplane no.',
                        // helperText: 'abc0000@gmail.com',
                        // helperStyle: TextStyle(fontFamily: 'Quciksand',color: Colors.yellow),
                      ),
                    ),
                    ),
                   

                  
                 
                    
                    
                  ],
                ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                           child: Text('UID Equipment' ,style:TextStyle( color:Color(0xFF474747),fontWeight: FontWeight.bold),),
                         ),
                            
                       ],
                     ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      
                      child:  Container(
                        width: double.infinity - 30,
                       
                        // child:Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     Padding(padding: EdgeInsets.only(left: 10),
                        //     child: Text('Runway 1') ,),
                           
                            
                        //     Icon(Icons.arrow_drop_down)
                        //   ],
                        // ),
                  child:      TextField(
                        controller: uidController,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(240, 240, 240, 100),
              filled: true
            ),
            // style: TextStyle(color:Color.fromRGBO(240, 240, 240, 100),),
            keyboardType: TextInputType.text,
            maxLines: 10,
          ),
                        height: 56,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 100),
                        ),
                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child:  TextField(
                        controller: problemController,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(240, 240, 240, 100),
              filled: true
            ),
            // style: TextStyle(color:Color.fromRGBO(240, 240, 240, 100),),
            keyboardType: TextInputType.text,
            maxLines: 10,
          ),
                    ),
         Expanded(
              child: ButtonTheme(
               minWidth: double.infinity-20,
              child: RaisedButton(
               color: Color(0xFF3DBAF1),
               onPressed: (){
                 _submit(partController.text,addrController.text,uidController.text,problemController.text,userUid,_token);
               },
               textColor: Color(0xFF092D6F),
               child: isreported?Center(child: CircularProgressIndicator(),)
               : Text('Submit'),
                 ),
              ),
            )
                ,
                        
              
          ],
        )
        
          
        ),
        
        )
         
              
             
          
      
    ));
   
  }
   Future _submit(String part,String addr , String uid ,String problem,String userUid,String token)async{
    setState(() {
      isreported = true;
    });
    final bool d = await http.get(
    Uri.parse('https://sih2020jss.herokuapp.com/report/$uid'),
     headers: {
       "Accept":"application/json",
       "Content-Type": "application/json",
       "Authorization": "Bearer $token",
     }).then((onValue){
       print('val is ${json.decode(onValue.body)}');
       if (json.decode(onValue.body)['message']=='failure')
       {
         return true;
       }
       else 
       {
         return false;
       }
     }).catchError((onError){
       print('Eoor${onError}');
      
     });
     if(d)
      {
        print('try creating');
        http.post(
    Uri.parse('https://sih2020jss.herokuapp.com/report'),
        body:json.encode({
          'uid':uid,
          'name':part,
          'address':addr,
          'problem':problem,
          'Authorization': 'Bearer $token',
          // 'person':userUid
      }),
     headers: {
       "Accept":"application/json",
       "Content-Type": "application/json",
       "Authorization": "Bearer $token",
     }).then((onValue){
       print('val is ${json.decode(onValue.body)}');
       return true;
     }).catchError((onError){
       print('Eoor${onError}');
       return false;
     });
     setState(() {
       isreported = false;
       Navigator.of(context).pop();
     });
      }
   }
}