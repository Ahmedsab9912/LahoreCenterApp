import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Models/CartItemsModel.dart';
import '../DashboardSM/SalesManDashboard.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var userid;
  double totalPrice = 0.0;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  CartItemsModel? cartItemsListModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getItemsData(),
              builder: (context, snapshot) {
                if (cartItemsListModel == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: cartItemsListModel!.cartItems?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Card(
                          elevation: 3,
                          margin: EdgeInsets.only(top: 4),
                          child: Padding(
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
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "Item Name:",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            cartItemsListModel!
                                                .cartItems![index].titmdsc
                                                .toString(),
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "Item Price:",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            cartItemsListModel!
                                                .cartItems![index].tsalrat
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          // Show the total price below in the center
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Buttons
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SalesManDashboardPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Continue Shopping',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle "Checkout" button press
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
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

  Future<CartItemsModel?> getItemsData() async {
    var response = await http.post(
      Uri.parse('https://www.crystalsolutions.com.pk/subhan/Cart_Item.php'),
      body: {
        'saleManId': userid,
      },
    );

    var datay = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      cartItemsListModel = CartItemsModel.fromJson(datay);

      // Calculate the total price
      calculateTotalPrice();
    }
    setState(() {});
    return cartItemsListModel;
  }

  void calculateTotalPrice() {
    totalPrice = 0.0;
    if (cartItemsListModel != null) {
      for (var item in cartItemsListModel!.cartItems!) {
        totalPrice += double.parse(item.tsalrat.toString());
      }
    }
  }

  getUserData() async {
    SharedPreferences sharedPrefences = await SharedPreferences.getInstance();
    userid = sharedPrefences.getString('empcod');
    setState(() {});
    getItemsData();
  }
}
