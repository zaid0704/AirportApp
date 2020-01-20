import './MyAppBar.dart';
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
    setState(() {
      cameraResult = cameraResult;
    });
    print('Camera Result is $cameraResult');
  }
  void initState() { 
    super.initState();
    _scan();
  }
  Widget build(BuildContext context) {
     TextEditingController solution = TextEditingController();
     TextEditingController addrController = TextEditingController();
     TextEditingController uidController = TextEditingController();
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      home:Scaffold(
        appBar: MyAppBar(context),
        body: SingleChildScrollView(
          child:   Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 15,right: 15),
              child:Center(
             child: Text('UID of Equipment: ${cameraResult}',style: TextStyle(color: Color(0xFF092D6F),fontSize: 20),),
              
           ) ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30,bottom: 10,top: 25),
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
                   

                  
                 
                    
                    
                  
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                           child: Text('UID of Part' ,style:TextStyle( color:Color(0xFF474747),fontWeight: FontWeight.bold),),
                         ),
                            
                       ],
                     ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      
                      child:  Container(
                        width: double.infinity - 30,
                       
                     
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
              padding: const EdgeInsets.all(30),
              child: TextField(
                
                controller: solution,
                keyboardType: TextInputType.text,
                maxLines: 6,
                decoration: InputDecoration(
                fillColor: Color.fromRGBO(240, 240, 240, 100),
              filled: true,

                  labelStyle: TextStyle(color: Color(0xFF000000),fontSize: 14),
                  labelText: 'Write your Solution Here'
                ),
              ),
            ),
           
           ButtonTheme(
             minWidth: double.infinity,
             height: 45,
             child:Padding(
               padding: const EdgeInsets.all(30),
               child: RaisedButton(
               onPressed: (){},
               color: Color(0xFF3DBAF1),
               child: Text('Resolved',style: TextStyle(color: Color(0xFF092D6F),fontSize: 20),),
             ),
             ),
              
           )
          ],
        ),
        )
      
      )
    );
    
  }
}