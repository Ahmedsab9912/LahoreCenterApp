import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lc/Login%20Ui/shared_preferences_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Admin/AllAPIs/API.dart';
import '../Models/ResponseModel.dart';
import '../MyFuntions/Funtions.dart';
import '../Admin/Dashboard/AdminDashboard.dart';
import '../Salesman/DashboardSM/SalesManDashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user_id = TextEditingController();
  TextEditingController user_pass = TextEditingController();
  FocusNode foucusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                    // height: 250,
                    width: 280,
                    image: AssetImage('images/UsamaLogo.png')),
              ),
              SizedBox(height: 10,),
              Text('USAMA ELECTRONICS',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
              SizedBox(height:40,),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: TextFormField(
                  controller: user_id,
                  focusNode: foucusEmail,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focusPassword);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'User Id',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black54,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white12,
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: user_pass,
                focusNode: focusPassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black54,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white12,
                        ))),
              ),
              SizedBox(height: 50),
              //Login Box Start
              InkWell(
                onTap: () {
                  loginFun();
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(
                          2.0,
                          6.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: ('Rubik Medium'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            // Lower Text Of Login Start
          ),
        ),
      ),
    );
  }

  loginFun() async {
    var uri = await http.post(
        Uri.parse(login),
        body: {
          'userid': user_id.text,
          'password': user_pass.text,
        });
    var dataz = jsonDecode(uri.body.toString());
    ResponseModel responseModel = ResponseModel.fromJson(dataz);
    if (responseModel.error == 200 && responseModel.user?.tusrtyp == 'Admin' ) {
      await shared_preferences.savedata(responseModel.user!, "Admin");
      My_Funtions.f_toast(context, 'Admin Login Successfully', Colors.green);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return DashboardPage();
          }));
    }else if (responseModel.error == 200 && responseModel.user?.tusrtyp == 'Salesman') {
      await shared_preferences.savedata(responseModel.user!, "Salesman");
      My_Funtions.f_toast(context, 'SalesMan Login Successfully', Colors.green);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return SalesManDashboardPage();
          }));
    } else {
      My_Funtions.f_toast(context, '${responseModel.message}', Colors.red);
    }
  }

  // SHARED PREFENCES GETTING THE USER TYPE
  getUserData() async {
    SharedPreferences sharedPrefences = await SharedPreferences.getInstance();
    var login = sharedPrefences.getString('loged');
    if (login == 'Collector') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DashboardPage();
      }));
    } else {
      return;
    }
  }


}