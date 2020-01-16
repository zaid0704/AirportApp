import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../handling_data/Auth.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool load_userData = true;
  Widget build(BuildContext context) {
   final auth = Provider.of<Auth>(context);
   Map<String,dynamic> userData = auth.getUserData;
   
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading:Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/logo.png',
          alignment: Alignment.center),
          ),
          
          title: Text('Flight UnderControl',style: TextStyle(color: Colors.white,fontSize: 18),),
          backgroundColor: Color(0xFF092D6F),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              initialValue: 0,
              onSelected: (selectedVal){
                print("$selectedVal");
                if (selectedVal == 3){
                 while(Navigator.of(context).canPop())
                  {
                    Navigator.of(context).pop();
                  }}
                  else if (selectedVal == 1)
                   {
                     Navigator.of(context).pushNamed('/problems');
                   }
              },
              itemBuilder: (_)=>[
                PopupMenuItem(
                  value: 0,
                  child: Text('Refresh',style: TextStyle(color: Color(0xFF092D6F)),),
                ),
                 PopupMenuItem(
                  value: 1,
                  child: Text('Problems',style: TextStyle(color: Color(0xFF092D6F)),),
                ),
                 PopupMenuItem(
                  value: 2,
                  child: Text('Help',style: TextStyle(color: Color(0xFF092D6F)),),
                ),
                 PopupMenuItem(
                  value: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                       Text('Logout',style: TextStyle(color: Color(0xFF092D6F)),),
                       Icon(Icons.arrow_right)
                    ],
                  )
                 
                )
              ],
            )
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
              color: Color(0xFFffffff),
              child: Container(
                height: 150,
                width: double.infinity,
                child: userData == null?Center(child: CircularProgressIndicator(),) 
                : UserDetails(userData),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 243,
                color:Color.fromRGBO(240, 240, 240, 100),
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
                  color: Color(0xFF092D6F),
                  child:IconButton(
                    icon:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Icon(Icons.bug_report,color: Colors.white,),
                        Text('Report',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    onPressed: (){
                      print('Report');
                      Navigator.of(context).pushNamed('/report');
                    },
                ),
                ),

                
                   GestureDetector(
                 
                  child:   Container(
                    width: 140,
                    height: 100,
                    color:  Color(0xFF3DBAF1),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Image.asset('assets/scanner.png',fit: BoxFit.cover,
                        width: 50,
                        height: 50,),
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
                  color:Color(0xFF092D6F),
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
                  Navigator.of(context).pushNamed('/resolved');
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
  Widget UserDetails(Map<String,dynamic> userData){

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 10,),
        Container(
          width: 70,
          height: 70,
          // child: Text('A'),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF092D6F),width: 2),
           shape: BoxShape.circle
          ),
        ),
        SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${userData['item']['name']}',style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold,fontSize: 22),),
            Text('${userData['item']['email']}',style: TextStyle(color: Color(0xFF000000)),),
            Text('${userData['item']['uid']}',style: TextStyle(color: Color(0xFF000000)),),

          ],
        )
      ],
    );
  }
}