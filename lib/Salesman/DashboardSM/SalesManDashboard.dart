import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../SupportPage/SupportScreen.dart';
import '../DashboardSM_Pages/CategorySM/CategorySMPage.dart';
import '../DashboardSM_Pages/CompanySM/CompanySMPage.dart';
import '../DashboardSM_Pages/Rate UpdateSM/RateUpdateSMPage.dart';
import '../DashboardSM_Pages/SearchSM/SearchSMPage.dart';
import 'SalesManDrawer.dart';

class SalesManDashboardPage extends StatefulWidget {
  const SalesManDashboardPage({Key? key}) : super(key: key);

  @override
  State<SalesManDashboardPage> createState() => _SalesManDashboardPageState();
}

class _SalesManDashboardPageState extends State<SalesManDashboardPage> {
  double textSize = 16.0;
  double boxHeight = 100;
  double boxWidth = 140;
  var _width;
  var _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * .95;
    _height = MediaQuery.of(context).size.height * .95;
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer:  SMDrawer(),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 30,right: 30,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  CompanySMPage();
                    }));
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: Container(
                        height: _height * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: 90,
                              height: 60,
                              image: AssetImage('images/company.png'),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Company',
                              style: TextStyle(
                                fontSize: _height * .019,
                                color: Colors.red[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CategorySMScreen();
                      }),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: Container(
                        height: _height * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: 90,
                              height: 60,
                              image: AssetImage('images/category.png'),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: _height * .019,
                                color: Colors.red[600],
                              ),
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
            Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SearchSMScreen();
                      }),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: Container(
                        height: _height * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: 90,
                              height: 60,
                              image: AssetImage('images/search.png'),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Search',
                              style: TextStyle(
                                fontSize: _height * .019,
                                color: Colors.red[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RateUpdateSMScreen();
                      }),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 15),
                      child: Container(
                        height: _height * .17,
                        width: _width * .37,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: 90,
                              height: 60,
                              image: AssetImage('images/rate.png'),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Rate Update',
                              style: TextStyle(
                                fontSize: _height * .019,
                                color: Colors.red[600],
                              ),
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
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return  SupportPage();
                    }));
                  },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15,top: 15),
                        child: Container(
                          height: _height * .17,
                          width: _width * .37,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Image(width: 90,
                                  height: 60,
                                  image: AssetImage('images/support.png')),
                              SizedBox(height: 15,),
                              Text('Support',style: TextStyle(fontSize: _height * .019,color: Colors.red[600]),
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
      ),
    );
  }
}
