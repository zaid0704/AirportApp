import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Auth with ChangeNotifier{
String name;
String uid;
String emailId;
String password;

// Auth(this.name,this.uid,this.emailId,this.password);
Map<String,dynamic> userData;
String get userUid{
  if (uid!=null)
   {
     return uid;
   }
}
Map<String,dynamic> get getUserData{
  if (userData != null)
   {
     return userData;
   }
}
Future<bool> signUp(String name,String emaildId,String uiid,String password)async{
  uid = uiid;
  final bool res  = await http.post(
    
    Uri.parse('https://sih2020jss.herokuapp.com/signup'),
        body:json.encode({
           'name':name,
           'email':emaildId,
           'uid':uiid,
          'password':password
      }),
     headers: {
       "Accept":"application/json",
       "Content-Type": "application/json"
     }).then((onValue){
       print('val is ${json.decode(onValue.body)}');
       return true;
     }).catchError((onError){
       print('Eoor${onError}');
       return false;
     });
     if(res)return true;
     else return false;
}
Future<bool> login(String uiid,String password)async{
  uid =uiid;
  final bool res  = await http.post(
    Uri.parse('https://sih2020jss.herokuapp.com/login'),
        body:json.encode({
           'uid':uiid,
          'password':password
      }),
     headers: {
       "Accept":"application/json",
       "Content-Type": "application/json"
     }).then((onValue){
       print('val is ${json.decode(onValue.body)}');
       userData = json.decode(onValue.body);
       notifyListeners();
       return true;
     }).catchError((onError){
       print('Eoor${onError}');
       return false;
     });
     if(res)return true;
     else return false;
}

}