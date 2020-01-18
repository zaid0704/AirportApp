import 'package:flutter/material.dart';
import './report.dart';
import './resolved.dart';
import './scanner.dart';
class TabsScren extends StatefulWidget {
  TabsScren({Key key}) : super(key: key);

  @override
  _TabsScrenState createState() => _TabsScrenState();
}

class _TabsScrenState extends State<TabsScren> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:  AppBar(
          
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.bug_report),
                text: 'Report',
              ),
              Tab(
                icon: Icon(Icons.scanner),
                text: 'Scanner',
              ),
              Tab(
                icon: Icon(Icons.flight),
                text: 'Resolved',
              )
            ],

          ),
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
        body: TabBarView(
          children: <Widget>[
            Report(),
            Scanner(),
            Resolved()
          ],
        ),
    ));
  }
}