import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Models/AllUsersModel.dart';
import '../AllAPIs/API.dart';
import 'AddUser.dart';
import 'UpdateUser.dart';

class UserMangmentScreen extends StatefulWidget {
  const UserMangmentScreen({super.key});

  @override
  State<UserMangmentScreen> createState() => _UserMangmentScreenState();
}

class _UserMangmentScreenState extends State<UserMangmentScreen> {

  List<AllUsersModel> UsersListModel = [];
  List<AllUsersModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController() ;

  @override
  void initState() {
    searchlistModel= UsersListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Management'),
      ),
      //FLOATING ACTION BUTTON ADDED
      floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  AddUserScreen();
            }));
          }
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14,right: 14),
              child: TextFormField(
                controller: search_Controller,
                onChanged: (action) =>  searchfuntion(action),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                      size: 35,
                      Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      search_Controller.clear();
                      searchlistModel.clear();
                      searchlistModel= UsersListModel;
                      // search_Controller.clear();
                      //   searchlistModel.clear();
                      //   salessManListModel.clear();

                    },
                    icon: Icon(Icons.cancel),
                  ),
                  hintText: 'Search',
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: getUserData(),
                    builder: (context,  snapshot) {
                      if (searchlistModel.isEmpty) {
                        return Center(
                            child: CircularProgressIndicator(
                              color: Colors.red[600],
                            ));
                      } else {
                        return ListView.builder(
                            itemCount: searchlistModel.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                EdgeInsets.only( right: 15, left: 15),
                                child: Card(
                                    elevation: 5.0,
                                    child:  ExpansionTile(
                                      iconColor: Colors.white,
                                      collapsedIconColor: Colors.white,
                                      title: Text(
                                        searchlistModel[index].tusrid.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8,right: 8),
                                          child: Column(
                                            children: [
                                              Table(columnWidths: {
                                                0: FlexColumnWidth(1),
                                                1: FlexColumnWidth(2),
                                              }, children: [
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Id:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(searchlistModel[index].tusrid.toString(), style:
                                                    TextStyle(fontSize: 16))
                                                    ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Password:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 5.0),
                                                      child: Text(searchlistModel[index].tusrpwd.toString(), style:
                                                      TextStyle(fontSize: 16))
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Name:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 5.0),
                                                      child: Text(searchlistModel[index].tusrnam.toString(), style:
                                                      TextStyle(fontSize: 16))
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Mobile:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 5.0),
                                                      child: Text(searchlistModel[index].tmobnum.toString(), style:
                                                      TextStyle(fontSize: 16))
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Email:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 5.0),
                                                      child: Text(searchlistModel[index].temladd.toString(), style:
                                                      TextStyle(fontSize: 16))
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Added Date:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 5.0),
                                                      child: Text(searchlistModel[index].tcrtdat.toString(), style:
                                                      TextStyle(fontSize: 16))
                                                  ),
                                                ]),
                                                TableRow(children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: 5.0),
                                                    child: Text(
                                                      "Status:",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 5.0),
                                                      child: Text(searchlistModel[index].tusrsts.toString(), style:
                                                      TextStyle(fontSize: 16))
                                                  ),
                                                ]),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Type:                      ${searchlistModel[index].tusrtyp.toString()}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              OutlinedButton(
                                                  onPressed:() {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                                      return  UpdateUserScreen(
                                                          allUsersModel: searchlistModel[index]);
                                                    }));
                                                    getUserData();
                                                  } ,
                                                  child:Row(
                                                    children: [
                                                      Icon(
                                                        color: Colors.red,
                                                        Icons.edit,)
                                                    ],
                                                  ) ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              );
                            });
                      }
                    } )
            ),
          ],
        ),
      ),
    );
  }


  Future<List<AllUsersModel>> getUserData() async {
    var response = await http
        .get(Uri.parse(GetUsers));

    var datax = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      UsersListModel.clear();
      for (Map c in datax) {
        UsersListModel.add(AllUsersModel.fromJson(c));
      }
    }
    setState(() {

    });
    return UsersListModel;
  }

  searchfuntion(String searchKey){
    setState(() {
      searchlistModel = UsersListModel.where((elementVar) =>elementVar.tusrid.toString().contains(searchKey.toLowerCase())).toList();

    });
  }
}
