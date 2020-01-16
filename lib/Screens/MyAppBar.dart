import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context){
  return  AppBar(
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
        );
}