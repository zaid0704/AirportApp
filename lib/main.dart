import './Screens/scanner.dart';

import './Screens/home_screen.dart';

import './Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './handling_data/Auth.dart';
import './Screens/signup.dart';
// void main() => runApp(SignUp());
// void main() => runApp(Login());
// void main() => runApp(MyApp());
 void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value:Auth() ,
        )
      ],
      child:
    MaterialApp(
    
         routes: {
        '/login':(ctx)=>Login(),
        '/homeScreen':(ctx)=>HomeScreen(),
        '/scanner':(ctx)=>Scanner()
      },
      home:HomeScreen()
    ),);
  }
}