import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: Icon(Icons.flight_takeoff,color: Colors.white,size: 30,),
          title: Text('Flight UnderControl',style: TextStyle(color: Colors.white,fontSize: 18),),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon:Icon(Icons.more_vert),
              onPressed: (){},)
          ],
        ),

        body: ListView(
          children: <Widget>[
            Stack(
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text('User Details'),
            Card(
              elevation: 6.0,
              color: Colors.purple,
              child: Container(
                height: 150,
                width: double.infinity,
                child: Text('User Details',),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 243,
                color: Colors.pink,
              ),
            Positioned(
              bottom: 0,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                 Container(
                  width: 110,
                  height: 80,
                  color: Color(0xFF003F87),
                  child:IconButton(
                    icon:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Icon(Icons.bug_report,color: Colors.white,),
                        Text('Report',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    onPressed: (){
                      print('Pressed');
                    },
                ),
                ),

                
                   GestureDetector(
                 
                  child:   Container(
                    width: 140,
                    height: 110,
                    color: Color(0xFF0BB5FF),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Icon(Icons.pages,color: Colors.white,),
                        SizedBox(height: 4,),
                        Text('Scanner',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).pushNamed('/scanner');
                    print("object");
                  },
                ),
                  
               GestureDetector(
                
                child: Container(
                  width: 110,
                  height: 80,
                  color: Color(0xFF003F87),
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Icon(Icons.flight,color: Colors.white,),
                        Text('Resolved',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                ),
                onTap: (){
                  print("Resolved");
                },
                )
              ],
            ) ,
            ),
          
              ],
            ),
          ],
        ),
          ],
        )
          ],
        )
        
        
      ),
    );
    
  }
}