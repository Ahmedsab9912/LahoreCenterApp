
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Login Ui/LoginPage.dart';
import '../../SupportPage/SupportScreen.dart';
import '../DashboardSM_Pages/CategorySM/CategorySMPage.dart';
import '../DashboardSM_Pages/CompanySM/CompanySMPage.dart';
import '../DashboardSM_Pages/Rate UpdateSM/RateUpdateSMPage.dart';
import '../DashboardSM_Pages/SearchSM/SearchSMPage.dart';



class SMDrawer extends StatefulWidget {
  const SMDrawer({Key? key}) : super(key: key);

  @override
  State<SMDrawer> createState() => _SMDrawerState();
}

class _SMDrawerState extends State<SMDrawer> {

  var logType;
  var userName ;
  var _width ;

  @override
  void initState() {
    getUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.height * .90;
    return Drawer(
      width: 280,
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                height: _width * .020,
                color: Colors.red[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/lahoreCenterLogo.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text('User Id: $userName',
                      style: TextStyle(
                        color: Colors.red[600],
                        fontSize:  _width * .020,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(size: 30, color: Colors.red[900], Icons.local_post_office),
            title: Text(
              'Company',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CompanySMPage()));
            },
          ),
          ListTile(
            leading: Icon(size: 30, color: Colors.red[900], Icons.auto_graph),
            title: Text(
              'Category',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CategorySMScreen()));
            },
          ),
          ListTile(
            leading: Icon(size: 30, color: Colors.red[900], Icons.search),
            title: Text(
              'Search',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchSMScreen()));
            },
          ),
          ListTile(
            leading: Icon(size: 30, color: Colors.red[900], Icons.rate_review_outlined),
            title: Text(
              'Rate Update',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => RateUpdateSMScreen()));
            },
          ),
          ListTile(
            leading: Icon(size: 30, color: Colors.red[900], Icons.support_agent),
            title: Text(
              'Support',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SupportPage()));
            },
          ),
          ListTile(
            leading: Icon(size: 30, color: Colors.red[900], Icons.login_rounded),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }


  getUserData() async {
    SharedPreferences sharedPrefences = await SharedPreferences.getInstance();
    logType = sharedPrefences.getString('loged');
    userName = sharedPrefences.getString('name');
    setState(() {

    });
  }


}