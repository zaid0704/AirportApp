import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../handling_data/Auth.dart';
import './MyAppBar.dart';
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
   List<dynamic> problems= userData['problems'];
    // 
   print('Problems are $problems');
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        appBar: MyAppBar(context),

        body:
            Stack(
          children: <Widget>[
           Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              width: double.infinity,
              height: 130,
              color: Colors.white,
              child: userData == null ?Center(child: CircularProgressIndicator(),) :
              UserDetails(userData),
            ),
            Positioned(
              top: 130,left: 0,
              child: 
              Container(
                width:MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height - 230,
                // color: Colors.blue,
                child: ListView.builder(
                  itemCount: problems.length,
                  itemBuilder: (ctx,index)=>Card(
            color: Colors.white,
            elevation: 10.0,
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:15,right: 15,top: 15),
                        child: Text('Type of Flight  ${problems[index]['uid']}',style: TextStyle(color: Color(0xFF092D6F),fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:15,right: 15,top: 15),
                        child: Row(children: <Widget>[
                      Text('Reported',style: TextStyle(color: Color(0xFFDB3535),fontWeight: FontWeight.bold)),
                      Icon(Icons.error,color: Color(0xFFDB3535),),
                      
                      ],),
                      ),
                       
                      
                      
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                      
                        padding: const EdgeInsets.only(left:15,right: 15,top: 15),
                        child:Text('${problems[index]['problem']}',style:TextStyle(color: Color(0xFF497E96)))
              
                      )
                      
                    ],
                  )
                    ],
                
              )
            ),
            
            
          ),
                  
                  
                )
              )
              
               
            ),
           
            Positioned(
              bottom: 0,
              child:    Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                 Container(
                  width: MediaQuery.of(context).size.width*0.31,
                  height: 70,
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
                    width: MediaQuery.of(context).size.width*0.38,
                    height: 84,
                    color:  Color(0xFF3DBAF1),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 2,),
                        Image.asset('assets/scanner.png',fit: BoxFit.cover,
                        width: 50,
                        height: 50,),
                        SizedBox(height: 4,),
                        Text('Scanner',style: TextStyle(color: Color(0xFF092D6F)),),
                        SizedBox(height: 2,),
                        Container(height: 2,
                        width: MediaQuery.of(context).size.width*0.38-20,
                        color: Colors.white,)
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
                  width: MediaQuery.of(context).size.width*0.31,
                  height: 70,
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