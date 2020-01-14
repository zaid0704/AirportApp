import 'package:flutter/material.dart';
import '../handling_data/Auth.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
 final GlobalKey<FormState> key = GlobalKey();
  TextEditingController uidController  = TextEditingController();
  TextEditingController passController = TextEditingController();
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF092D6F),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Center(
             child:Container(
               width: 82,
               height: 44,
               decoration: BoxDecoration(
                 color: Color(0xFF092D6F),
                 image:DecorationImage(
                   image: AssetImage('assets/logo.png'),
                   fit: BoxFit.cover
                 )
               ),
             )
           ),
              Padding(
                padding: const EdgeInsets.all(10,),
                child: Text('Flight UnderControl',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(
                height: 100,
              ),
              Form(
            key: key,
                       
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Padding(
                     padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child:  TextFormField(
                        keyboardType: TextInputType.text,
                        controller: uidController,
                        style: TextStyle(fontFamily: 'Quicksand',fontSize: 18,color: Colors.white),
                        
                        validator: (val){
                          if (val.isEmpty )
                           {
                             return 'Invalid uid';
                           
                           }
                        },
                      decoration: InputDecoration(
                         filled: true,
                        fillColor: Color(0xFF20417D),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      borderSide: BorderSide(color: Color(0xFF20417D)),
                      ), 
               
                     hintStyle: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      borderSide: BorderSide(color: Color(0xFF20417D)),
               ),
                        labelStyle: TextStyle(fontFamily: 'Quicksand',fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
                        labelText: 'Unique Id number',
                        // helperText: 'abc0000@gmail.com',
                        helperStyle: TextStyle(fontFamily: 'Quciksand',color: Colors.yellow),
                      ),
                    ),
                    ),
                   
                    Padding(
                     padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child:  TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: passController,
                        style: TextStyle(fontFamily: 'Quicksand',fontSize: 14,color: Colors.white),
                        
                        validator: (val){
                          if (val.isEmpty )
                           {
                             return 'Invalid password';
                           
                           }
                        },
                      decoration: InputDecoration(
                         filled: true,
                        fillColor: Color(0xFF20417D),
                        enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                   borderSide: BorderSide(color: Color(0xFF20417D)),
                   ), 
               
                hintStyle: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold),
               focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(2.0)),
               borderSide: BorderSide(color: Color(0xFF20417D)),
        ),
                        labelStyle: TextStyle(fontFamily: 'Quicksand',fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
                        labelText: 'Password',
                        // helperText: 'abc0000@gmail.com',
                        // helperStyle: TextStyle(fontFamily: 'Quciksand',color: Colors.yellow),
                      ),
                    ),
                    ),
                   

                  
                 Row(
                   children: <Widget>[
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(30),
                         child: RaisedButton(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(2))
                           ),
                           onPressed:(){
                             _submit(context,uidController,passController,auth);
                           } ,
                           color: Color(0xFF3DBAF1),
                         child: Text('Login',style: TextStyle(color: Color(0xFF092D6F),fontSize: 14),),
                       ),
                       )
                       
                     )
                   ],
                 )
                    
                    
                  ],
                ),
                     ),
              ],  
            )
          ],
        ),
      ),
    );
  }
  void _submit(BuildContext context,TextEditingController uid, TextEditingController pass , Auth auth)async{
    key.currentState.save();
    if(key.currentState.validate()){
      print("success login");
      final d = await auth.login(uid.text,pass.text);
      if(d)
      Navigator.of(context).pushNamed('/homeScreen');
      else
      print('login failed');
    }
  }
}