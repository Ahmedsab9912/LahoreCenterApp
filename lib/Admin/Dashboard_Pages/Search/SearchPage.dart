import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../Models/SearchModel.dart';
import '../../AllAPIs/API.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  var _width;
  var _hight;
  List<SearchModel> searchApiListModel = [];
  List<SearchModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();
  var f = NumberFormat("###,###.#", "en_US");

  @override
  void initState() {
    // searchlistModel = searchApiListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * .95;
    _hight = MediaQuery.of(context).size.height * .95;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10,top: 10),
            child: TextFormField(
              controller: search_Controller,
              onChanged: (action) {
                searchfuntion(action);
                if(search_Controller.text.isEmpty){
                  searchlistModel.clear();
                }
              },
              decoration: InputDecoration(
                prefixIcon: Icon(size: 35, Icons.search,),
                suffixIcon: IconButton(
                  onPressed: () {
                    search_Controller.clear();
                    searchlistModel.clear();
                  },
                  icon: Icon(Icons.cancel),
                ),
                hintText: 'Search Model',
                labelText: 'Search Model',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: getUserData(),
                  builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: searchlistModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Card(
                                elevation: 3,
                                margin: EdgeInsets.only(top: 4),
                                child: ExpansionTile(
                                  iconColor: Colors.white,
                                  collapsedIconColor: Colors.white,
                                  title: Text(
                                    searchlistModel[index].titmdsc.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8,right: 8,bottom: 5),
                                      child: Column(
                                        children: [
                                          Table(columnWidths: {
                                            0: FlexColumnWidth(1),
                                            1: FlexColumnWidth(3),
                                          }, children: [
                                            TableRow(children: [
                                              Padding(
                                                padding:
                                                EdgeInsets.only(top: 5.0),
                                                child: Text(
                                                  "Pur Rate:",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.only(top: 5.0),
                                                child: Text(
                                                  f.format(double.parse(
                                                    searchlistModel[index]
                                                        .tpurrat ??
                                                        "0",
                                                  )),
                                                  style:
                                                  TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ]),
                                          ]),
                                          Table(
                                            columnWidths: {
                                              0: FlexColumnWidth(1),
                                              1: FlexColumnWidth(1),
                                            },
                                            children: [
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "SM Rate:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    f.format(double.parse(
                                                      searchlistModel[index]
                                                          .tmanrat ??
                                                          "0",
                                                    )),
                                                    style:
                                                    TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "MRP:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    f.format(double.parse(
                                                      searchlistModel[index]
                                                          .trtlrat ??
                                                          "0",
                                                    )),
                                                    style:
                                                    TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Hlf Rate:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    f.format(double.parse(
                                                      searchlistModel[index]
                                                          .thlfrat ??
                                                          "0",
                                                    )),
                                                    style:
                                                    TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Fix Rate:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    f.format(double.parse(
                                                      searchlistModel[index]
                                                          .tfixrat ??
                                                          "0",
                                                    )),
                                                    style:
                                                    TextStyle(fontSize: 15),
                                                  ),
                                                )
                                              ]),
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Sale Rate:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    f.format(double.parse(
                                                      searchlistModel[index]
                                                          .tsalrat ??
                                                          "0",
                                                    )),
                                                    style:
                                                    TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Lock Rate:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    f.format(double.parse(
                                                      searchlistModel[index]
                                                          .tlckrat ??
                                                          "0",
                                                    )),
                                                    style:
                                                    TextStyle(fontSize: 16),
                                                  ),
                                                )
                                              ]),
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "last Rate:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    searchlistModel[index]
                                                        .tlstdat
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Last Time:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    searchlistModel[index]
                                                        .tlsttim
                                                        .toString(),
                                                    style:
                                                    TextStyle(fontSize: 15),
                                                  ),
                                                )
                                              ]),
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Stock:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    searchlistModel[index]
                                                        .titmqnt
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    "Comm:",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 5.0),
                                                  child: Text(
                                                    searchlistModel[index]
                                                        .tcomamt ??
                                                        '0',
                                                    style:
                                                    TextStyle(fontSize: 15),
                                                  ),
                                                )
                                              ]),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  ))
        ],
      ),
    );
  }
  Future<List<SearchModel>> getUserData() async {
    var response = await http.get(
        Uri.parse(SearchItemAll));

    var dataz = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      searchApiListModel.clear();
      for (Map i in dataz) {
        searchApiListModel.add(SearchModel.fromJson(i));
      }
    }
    setState(() {});
    return searchApiListModel;
  }

  searchfuntion(String searchKey) {
    searchlistModel = searchApiListModel
        .where((elementVar) =>
        elementVar.titmdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }
}
