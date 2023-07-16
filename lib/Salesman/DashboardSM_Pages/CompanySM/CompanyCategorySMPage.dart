import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../Admin/AllAPIs/API.dart';
import '../../../Models/CompanyCategoryModel.dart';
import '../../../Models/CompanyModel.dart';
import '../../AddToCartPage/CartPage.dart';
import 'CategoryItemsSMPage.dart';


class CompanyCategorySMScreen extends StatefulWidget {
  CompanyModel companyModel;

  CompanyCategorySMScreen({required this.companyModel, Key? key}) : super(key: key);

  @override
  State<CompanyCategorySMScreen> createState() => _CompanyCategorySMScreenState();
}

class _CompanyCategorySMScreenState extends State<CompanyCategorySMScreen> {

  var _width;

  List<CompanyCategoryModel> companyCategoryListModel = [];
  List<CompanyCategoryModel> searchlistModel = [];
  TextEditingController search_Controller = TextEditingController();

  @override
  void initState() {
    searchlistModel = companyCategoryListModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * .90;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.companyModel.tcmpdsc.toString()),
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
                    searchlistModel = companyCategoryListModel;
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
                                            CategoryItemsSMScreen(companyCategoryModel: searchlistModel[index], companyModel: widget.companyModel),


                                      ));
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
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: Text(
                                                      searchlistModel[index].tctgcod.toString(),
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: Text(
                                                      searchlistModel[index].tctgdsc.toString(),
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }

  Future<List<CompanyCategoryModel>> getUserData() async {
    var response = await http.post(
        Uri.parse(companycategory),
        body: {
          'PCmpCod': widget.companyModel.tcmpcod,
        });

    var datay = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      companyCategoryListModel.clear();
      for (Map i in datay) {
        companyCategoryListModel.add(CompanyCategoryModel.fromJson(i));
      }
    }
    setState(() {});
    return companyCategoryListModel;
  }


  searchfuntion(String searchKey) {
    searchlistModel = companyCategoryListModel
        .where((elementVar) =>
        elementVar.tctgdsc.toString().contains(searchKey.toUpperCase()))
        .toList();

    setState(() {});
  }
}
