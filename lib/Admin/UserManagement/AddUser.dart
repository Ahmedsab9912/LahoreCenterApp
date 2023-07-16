import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/ResponseModel.dart';
import '../../MyFuntions/Funtions.dart';
import '../AllAPIs/API.dart';
class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  //ADDING FORM KEY VARIABLE
  final _formKey = GlobalKey<FormState>();
  // DROP DOWN VALUES OF USER STATUS
  String? dropdown_uStatus;

  List<DropdownMenuItem<String>> get ddmItems_uStatus {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Yes"), value: "Yes"),
      DropdownMenuItem(child: Text("No"), value: "No"),
    ];
    return menuItems;
  }

  // DROP DOWN VALUES OF USER STATUS
  String? dropDown_uType;
  List<DropdownMenuItem<String>> get ddmItems_userType {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Admin"), value: "Admin"),
      DropdownMenuItem(child: Text("Salesman"), value: "Salesman"),
    ];
    return menuItems;
  }

  TextEditingController controller_userId = TextEditingController();
  TextEditingController controller_userName = TextEditingController();
  TextEditingController controller_userPassword = TextEditingController();
  TextEditingController controller_userMobile = TextEditingController();
  TextEditingController controller_user_Email = TextEditingController();
  TextEditingController controller_user_Status = TextEditingController();
  TextEditingController controller_user_Type = TextEditingController();
  TextEditingController controller_location_id = TextEditingController();
  TextEditingController controller_salesman_code = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controller_userId,
                      validator: (formValidate) {
                        if (formValidate.toString().isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter User Id',
                        labelText: 'Enter Id',
                        fillColor: Colors.grey[200],
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller_userName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                        labelText: 'Enter Name',
                        fillColor: Colors.grey[200],
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller_userPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Enter Password',
                        fillColor: Colors.grey[200],
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller_userMobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile',
                        labelText: 'Enter Mobile ',
                        fillColor: Colors.grey[200],
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller_user_Email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        labelText: 'Enter Email',
                        fillColor: Colors.grey[200],
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // DROPDOWN MENU OF USER STATUS
                    DropdownButtonFormField(
                        validator: (valuez) {
                          if (valuez!.isEmpty) {
                            return 'Plese enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Select User Status',
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black26, width: 1),
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // filled: true,
                          // fillColor: Colors.blueAccent,
                        ),
                        // dropdownColor: Colors.blueAccent,
                        value: dropdown_uStatus,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdown_uStatus = newValue!;
                          });
                        },
                        items: ddmItems_uStatus),
                    SizedBox(
                      height: 10,
                    ),
                    // DROPDOWN MENU OF USER STATUS
                    DropdownButtonFormField(
                        validator: (valuez) {
                          if (valuez!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Select User Type',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // filled: true,
                          // fillColor: Colors.blueAccent,
                        ),
                        // dropdownColor: Colors.blueAccent,
                        value: dropDown_uType,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDown_uType = newValue!;
                          });
                        },
                        items: ddmItems_userType),

                    dropDown_uType == 'Salesman'
                        ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: controller_location_id,
                            validator: (valuez){
                              if (valuez!.isEmpty){
                                return 'Please Enter some text';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: InputDecoration(
                                labelText: 'Write Location',
                                hintText: 'Location Code',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: controller_salesman_code,
                          validator: (valuez){
                            if (valuez!.isEmpty){
                              return 'Please Enter some text';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          decoration: InputDecoration(
                              labelText: 'Write Salesman Code',
                              hintText: 'Salesman Code',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                      ],
                    )
                        : Text(''),

                    // if (dropDown_uType == "Salesman")
                    //   Column(
                    //     children: [
                    //       TextFormField(
                    //         decoration: InputDecoration(
                    //             hintText: 'Location Code',
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //             )),
                    //       ),
                    //       SizedBox(
                    //         height: 10,
                    //       ),
                    //       TextFormField(
                    //         decoration: InputDecoration(
                    //             hintText: 'Salesman Code',
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                     SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                        ),
                        onPressed: () {
                          //FUNCTION FOR ADDING USER
                          addUser();
                          if (_formKey.currentState!.validate()) {
                            // Process data.
                          }
                        },
                        child: Text('Add User'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addUser() async {
    var uri = await http.post(
        Uri.parse(AddUser),
        body: {
          'userid': controller_userId.text,
          'username': controller_userName.text,
          'password': controller_userPassword.text,
          'mobile': controller_userMobile.text,
          'email': controller_user_Email.text,
          'status':dropdown_uStatus,
          'userType':dropDown_uType,
          'location_id':controller_location_id.text,
          'saleManCode':controller_salesman_code.text,
        });

    var dataz = jsonDecode(uri.body.toString());
    ResponseModel responseModel = ResponseModel.fromJson(dataz);

    if (responseModel.error == 200) {
      My_Funtions.f_toast(context, '${responseModel.message}', Colors.green);
    } else {
      My_Funtions.f_toast(context, '${responseModel.message}', Colors.red);
    }
  }
}
