import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../Models/RateUpdateModel.dart';
import '../../../MyFuntions/Funtions.dart';
import '../../AllAPIs/API.dart';

class RateUpdateScreen extends StatefulWidget {
  const RateUpdateScreen({Key? key}) : super(key: key);

  @override
  State<RateUpdateScreen> createState() => _RateUpdateScreenState();
}

class _RateUpdateScreenState extends State<RateUpdateScreen> {
  var dateTimeFormat = DateFormat("dd-MM-yyyy")
      .format(DateTime.now().subtract(Duration(days: 0)));

  var f = NumberFormat("###,###.#", "en_US");
  List<RateUpdateModel> rateUpdateListModel = [];
  List<RateUpdateModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();
  bool showStockOnly = false;

  @override
  void initState() {
    searchlistModel = rateUpdateListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Update'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: search_Controller,
                    onChanged: (action) {
                      searchfuntion(action);
                      if (search_Controller.text.isEmpty) {
                        searchlistModel.clear();
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        size: 35,
                        Icons.search,
                      ),
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
                SizedBox(width:5),
                Text('In-Stock'),
                Checkbox(
                  value: showStockOnly,
                  onChanged: (value) {
                    setState(() {
                      showStockOnly = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                dateTimePicker();
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.deepOrangeAccent),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    dateTimeFormat.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                if (searchlistModel.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: showStockOnly
                        ? searchlistModel
                        .where((item) => int.parse(item.titmqnt!) != 0)
                        .length
                        : searchlistModel.length,
                    itemBuilder: (context, index) {
                      if (showStockOnly &&
                          int.parse(searchlistModel[index].titmqnt!) == 0) {
                        return Container(); // Skip rendering items with stock value below or equal to 0
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
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
                                padding:
                                EdgeInsets.only(left: 8, right: 8, bottom: 5),
                                child: Column(
                                  children: [
                                    Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(1),
                                        1: FlexColumnWidth(3),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Pur Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].tpurrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(1),
                                        1: FlexColumnWidth(1),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "SM Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].tmanrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "MRP:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].trtlrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Hlf Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].thlfrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Fix Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].tfixrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          )
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Sale Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].tsalrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Lock Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              f.format(double.parse(
                                                searchlistModel[index].tlckrat ??
                                                    "0",
                                              )),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          )
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "last Rate:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              searchlistModel[index].tlstdat
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Last Time:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              searchlistModel[index].tlsttim
                                                  .toString(),
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          )
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Stock:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              searchlistModel[index].titmqnt
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "Comm:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              searchlistModel[index].tcomamt ??
                                                  '0',
                                              style: TextStyle(fontSize: 15),
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
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<RateUpdateModel>> getUserData() async {
    var response = await http.post(Uri.parse(itemall), body: {
      'date': dateTimeFormat,
    });

    var datay = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      rateUpdateListModel.clear();
      for (Map i in datay) {
        rateUpdateListModel.add(RateUpdateModel.fromJson(i));
      }
    }
    setState(() {});
    return rateUpdateListModel;
  }

  searchfuntion(String searchKey) {
    searchlistModel = rateUpdateListModel
        .where((elementVar) =>
        elementVar.titmdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }

  // DATE-TIME PICKER
  dateTimePicker() {
    DateTime? _dateTime;
    showDatePicker(
      context: context,
      initialDate: _dateTime == null ? DateTime.now() : _dateTime,
      firstDate: DateTime(2000, 01),
      lastDate: DateTime(2050, 12),
    ).then((date) {
      setState(() {
        try {
          _dateTime = date!;
          dateTimeFormat = DateFormat('dd-MM-yyyy').format(_dateTime!);
        } catch (e) {
          // print(e);
        }
        My_Funtions.f_toast(context, 'Date Update Successfully', Colors.green);
      });
    });
  }
}