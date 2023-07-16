import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Models/CategoryCompanyModel.dart';
import '../../../Models/CategoryModel.dart';
import '../../AllAPIs/API.dart';
import 'CategoryCompanyItemspage.dart';

class CategoryCompanyPage extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryCompanyPage({required this.categoryModel, Key? key})
      : super(key: key);

  @override
  State<CategoryCompanyPage> createState() => _CategoryCompanyPageState();
}

class _CategoryCompanyPageState extends State<CategoryCompanyPage> {
  List<CategoryCompanyModel> categoryCompanyListModel = [];
  List<CategoryCompanyModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();

  @override
  void initState() {
    searchlistModel = categoryCompanyListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryModel.tctgdsc.toString()),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: TextFormField(
              controller: search_Controller,
              onChanged: (action) => searchfuntion(action),
              decoration: InputDecoration(
                prefixIcon: Icon(size: 35, Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    search_Controller.clear();
                    searchlistModel.clear();
                    searchlistModel = categoryCompanyListModel;
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
                  builder: (context, snapshot) {
                    if (searchlistModel.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: searchlistModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CategoryCompanyItemsScreen(
                                                categoryCompanyModel:
                                                    searchlistModel[index],
                                                categoryModel:
                                                    widget.categoryModel),
                                      ));
                                },
                                child: Card(
                                    margin: EdgeInsets.only(top: 5),
                                    elevation: 4,
                                    // shape: RoundedRectangleBorder(
                                    //   side: BorderSide(color: Colors.red),
                                    //   // borderRadius:
                                    //   // BorderRadius.all(Radius.circular(15))
                                    // ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  searchlistModel[index]
                                                      .tcmpcod
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  searchlistModel[index]
                                                      .tcmpdsc
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }

  Future<List<CategoryCompanyModel>> getUserData() async {
    var response = await http.post(Uri.parse(categorycompany), body: {
      'PCtgCod': widget.categoryModel.tctgcod,
    });

    var datay = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      categoryCompanyListModel.clear();
      for (Map i in datay) {
        categoryCompanyListModel.add(CategoryCompanyModel.fromJson(i));
      }
    }
    setState(() {});
    return categoryCompanyListModel;
  }

  searchfuntion(String searchKey) {
    searchlistModel = categoryCompanyListModel
        .where((elementVar) =>
            elementVar.tcmpdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }
}
