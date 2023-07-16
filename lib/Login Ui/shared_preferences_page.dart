
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/ResponseModel.dart';
import '../MyFuntions/Funtions.dart';
import 'LoginPage.dart';




class shared_preferences {

  static savedata(User user , String loged) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id', user.id??'');
    sp.setString('userid', user.tusrid.toString());
    sp.setString('name', user.tusrnam??'');
    sp.setString('date', user.tcrtdat??'');
    sp.setString('colCode', user.tloccod??'');
    sp.setString('userstats', user.tusrsts??'');
    sp.setString('usertype', user.tusrtyp??'');
    sp.setString('password', user.tusrpwd??'');
    sp.setString('location', user.tloccod??'');
    sp.setString('empcod', user.tempcod??'');
    sp.setString('loged', loged );

  }
  // SHAREDPREFERENCEFOR LOGOUT(BOTH)
  static Logout(BuildContext context) async{
    My_Funtions.f_toast(context, 'Logout Successfully' , Colors.red);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        }
    ));
  }
}