import 'package:flutter/material.dart';

import '../Dashboard_Pages/Category/CategoryPage.dart';
import '../Dashboard_Pages/Company/CompanyPage.dart';
import '../Dashboard_Pages/Rate Update/RateUpdatePage.dart';
import '../Dashboard_Pages/Search/SearchPage.dart';
import '../UserManagement/userManagement_page.dart';
import 'AdminDrawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  double textSize = 16.0;
  double boxHeight = 100;
  double boxWidth = 140;
  var _width;
  var _hight;


  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * .95;
    _hight = MediaQuery.of(context).size.height * .95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
        drawer:  MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 30,right: 30,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  CompanyPage();
                  }));
                },
                  child: Card(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15,top: 15),
                      child: Container(
                        height: _hight * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image(width: 90,
                                height: 60,
                                image: AssetImage('images/company.png')),
                            SizedBox(height: 15,),
                            Text('Company',style: TextStyle(fontSize: _hight * .019,color: Colors.red[600]),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  CategoryScreen();
                  }));
                },
                  child: Card(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15,top: 15),
                      child: Container(
                        height: _hight * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image(width: 90,
                                height: 60,
                                image: AssetImage('images/category.png')),
                            SizedBox(height: 15,),
                            Text('Category',style: TextStyle(fontSize: _hight * .019,color: Colors.red[600]),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30,right: 30,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  SearchScreen();
                  }));
                },
                  child: Card(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15,top: 15),
                      child: Container(
                        height: _hight * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image(width: 90,
                                height: 60,
                                image: AssetImage('images/search.png')),
                            SizedBox(height: 15,),
                            Text('Search',style: TextStyle(fontSize: _hight * .019,color: Colors.red[600]),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  RateUpdateScreen();
                  }));
                },
                  child: Card(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15,top: 15),
                      child: Container(
                        height: _hight * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image(width: 90,
                                height: 60,
                                image: AssetImage('images/rate.png')),
                            SizedBox(height: 15,),
                            Text('Rate Update',style: TextStyle(fontSize: _hight * .019,color: Colors.red[600]),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30,right: 30,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  UserMangmentScreen();
                  }));
                },
                  child: Card(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15,top: 15),
                      child: Container(
                        height: _hight * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image(width: 90,
                                height: 60,
                                image: AssetImage('images/user.png')),
                            SizedBox(height: 15,),
                            Text('Users',style: TextStyle(fontSize: _hight * .019,color: Colors.red[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
      
    );
  }
}
