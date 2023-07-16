import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Models/CompanyModel.dart';
import '../../AllAPIs/API.dart';
import 'CompanyCategory.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  List<CompanyModel> companyListModel = [];
  List<CompanyModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();

  @override
  void initState() {
    searchlistModel = companyListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TextFormField(
              controller: search_Controller,
              onChanged: (action) => searchfuntion(action),
              decoration: InputDecoration(
                prefixIcon: Icon(size: 35, Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    search_Controller.clear();
                    searchlistModel.clear();
                    searchlistModel = companyListModel;
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
                                              CompanyCategoryPage(
                                                  companyModel:
                                                      searchlistModel[index])));
                                },
                                child: Card(
                                    margin: EdgeInsets.only(top: 3),
                                    elevation: 3,
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

  Future<List<CompanyModel>> getUserData() async {
    var response = await http.get(Uri.parse(company));

    var dataz = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      companyListModel.clear();
      for (Map i in dataz) {
        companyListModel.add(CompanyModel.fromJson(i));
      }
    }
    setState(() {});
    return companyListModel;
  }

  searchfuntion(String searchKey) {
    searchlistModel = companyListModel
        .where((elementVar) =>
            elementVar.tcmpdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }
}
