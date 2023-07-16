import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Models/CategoryModel.dart';
import '../../AllAPIs/API.dart';
import 'CategoryCompaniesPage.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<CategoryModel> catrgoryListModel = [];
  List<CategoryModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();

  @override
  void initState() {
    searchlistModel = catrgoryListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10,top: 10),
            child: TextFormField(
              controller: search_Controller,
              onChanged: (action) => searchfuntion(action),
              decoration: InputDecoration(
                prefixIcon: Icon(size: 35, Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    search_Controller.clear();
                    searchlistModel.clear();
                    searchlistModel = catrgoryListModel;
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
                                              CategoryCompanyPage(categoryModel: searchlistModel[index],)));
                                },
                                child: Card(
                                    margin: EdgeInsets.only(top: 3),
                                    elevation: 1,
                                    // shape: RoundedRectangleBorder(
                                    //   side: BorderSide(color: Colors.deepOrangeAccent),
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
                                                      .tctgcod
                                                      .toString(),
                                                  style:
                                                  TextStyle(fontSize: 14),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  searchlistModel[index]
                                                      .tctgdsc
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

  Future<List<CategoryModel>> getUserData() async {
    var response = await http.get(
        Uri.parse(category));

    var dataz = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      catrgoryListModel.clear();
      for (Map i in dataz) {
        catrgoryListModel.add(CategoryModel.fromJson(i));
      }
    }
    setState(() {});
    return catrgoryListModel;
  }

  searchfuntion(String searchKey) {
    searchlistModel = catrgoryListModel
        .where((elementVar) =>
        elementVar.tctgdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }
}
