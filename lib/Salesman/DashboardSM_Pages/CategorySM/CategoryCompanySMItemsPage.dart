import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Admin/AllAPIs/API.dart';
import '../../../Models/CategoryCompanyModel.dart';
import '../../../Models/CategoryModel.dart';
import '../../../Models/ItemsModel.dart';
import '../../AddToCartPage/CartPage.dart';

class CategoryCompanyItemsSMScreen extends StatefulWidget {
  CategoryCompanyModel categoryCompanyModel;
  CategoryModel categoryModel;

  CategoryCompanyItemsSMScreen({
    required this.categoryModel,
    required this.categoryCompanyModel,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryCompanyItemsSMScreen> createState() =>
      _CategoryCompanyItemsSMScreenState();
}

class _CategoryCompanyItemsSMScreenState
    extends State<CategoryCompanyItemsSMScreen> {
  var _width, empcod;
  var _hight;
  var f = NumberFormat("###,###.#", "en_US");
  List<ItemsModel> companyCategoryModel = [];
  List<ItemsModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();
  int quantity = 0;
  bool showStockOnly = false;

  @override
  void initState() {
    searchlistModel = companyCategoryModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * .95;
    _hight = MediaQuery.of(context).size.height * .95;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryCompanyModel.tcmpdsc.toString()),
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
                    onChanged: (action) => searchfuntion(action),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 35),
                      suffixIcon: IconButton(
                        onPressed: () {
                          search_Controller.clear();
                          searchlistModel.clear();
                          searchlistModel = companyCategoryModel;
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
                        .where((item) => double.parse(item.titmqnt!) != 0)
                        .length
                        : searchlistModel.length,
                    itemBuilder: (context, index) {
                      if (showStockOnly &&
                          double.parse(searchlistModel[index].titmqnt!) == 0) {
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
                                fontSize: 14,
                              ),
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
          )
        ],
      ),
    );
  }

  Future<List<ItemsModel>> getUserData() async {
    var response = await http.post(
      Uri.parse(companycategoryitem),
      body: {
        'PCmpCod': widget.categoryCompanyModel.tcmpcod,
        'PCtgCod': widget.categoryModel.tctgcod,
      },
    );

    var datay = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      companyCategoryModel.clear();
      for (Map i in datay) {
        companyCategoryModel.add(ItemsModel.fromJson(i));
      }
    }
    setState(() {});
    return companyCategoryModel;
  }

  searchfuntion(String searchKey) {
    searchlistModel = companyCategoryModel
        .where((elementVar) =>
        elementVar.titmdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }

  void addToCart(String itemName, double price, int quantity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    empcod = sharedPreferences.getString('empcod') ?? '';

    var response = await http.post(
      Uri.parse(Add_Cart),
      body: {
        'saleManId': empcod,
        'qty': quantity.toString(),
        'itemDec': itemName,
        'smRate': price.toString(),
      },
    );

    var data = jsonDecode(response.body);

    if (data['error'] == 200) {
      displayToast(context, data['message'], Colors.green);
    } else {
      displayToast(context, data['message'], Colors.red);
    }
  }

  void displayToast(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}