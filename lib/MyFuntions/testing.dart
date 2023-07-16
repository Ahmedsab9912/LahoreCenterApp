import 'dart:convert';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/collector_model.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample> {

  var usrName, colCode, colLocation;

  CollectorModel? collectorListModel;

  @override
  void initState() {
    getSharedPrefData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.blue[900],
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Collector",
                ),
                Tab(
                  text: "Inst",
                ),
                Tab(
                  text: "Count",
                ),
                Tab(
                  text: "%",
                ),
              ],
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            //Col CHART
            DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': 'Jan', 'measure':  collectorListModel!.janCol?? '0'},
                    {'domain': 'Feb', 'measure':  collectorListModel!.febCol?? '0'},
                    {'domain': 'Mar', 'measure':  collectorListModel!.marCol?? '0'},
                    {'domain': 'Apr', 'measure':  collectorListModel!.aprCol?? '0'},
                    {'domain': 'May', 'measure':  collectorListModel!.mayCol?? '0'},
                    {'domain': 'Jun', 'measure':  collectorListModel!.junCol?? '0'},
                    {'domain': 'Jul', 'measure':  collectorListModel!.junCol?? '0'},
                    {'domain': 'Aug', 'measure':  collectorListModel!.julCol?? '0'},
                    {'domain': 'Sep', 'measure':  collectorListModel!.augCol?? '0'},
                    {'domain': 'Oct', 'measure':  collectorListModel!.sepCol?? '0'},
                    {'domain': 'Nov', 'measure':  collectorListModel!.octCol?? '0'},
                    {'domain': 'Dec', 'measure':  collectorListModel!.novCol?? '0'},
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.grey,
              measureLabelPaddingToAxisLine: 20,
              barColor: (barData, index, id) => Colors.blue,
              showBarValue: true,
            ),
            //Inst CHART
            DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': 'Jan', 'measure':  collectorListModel!.janIns?? '0'},
                    {'domain': 'Feb', 'measure':  collectorListModel!.febIns?? '0'},
                    {'domain': 'Mar', 'measure':  collectorListModel!.marIns?? '0'},
                    {'domain': 'Apr', 'measure':  collectorListModel!.aprIns?? '0'},
                    {'domain': 'May', 'measure':  collectorListModel!.mayIns?? '0'},
                    {'domain': 'Jun', 'measure':  collectorListModel!.junIns?? '0'},
                    {'domain': 'Jul', 'measure':  collectorListModel!.junIns?? '0'},
                    {'domain': 'Aug', 'measure':  collectorListModel!.julIns?? '0'},
                    {'domain': 'Sep', 'measure':  collectorListModel!.augIns?? '0'},
                    {'domain': 'Oct', 'measure':  collectorListModel!.sepIns?? '0'},
                    {'domain': 'Nov', 'measure':  collectorListModel!.octIns?? '0'},
                    {'domain': 'Dec', 'measure':  collectorListModel!.novIns?? '0'},
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.grey,
              measureLabelPaddingToAxisLine: 20,
              barColor: (barData, index, id) => Colors.green,
              showBarValue: true,
            ),
            //Count CHART
            DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': 'Jan', 'measure':  collectorListModel!.janCount?? '0'},
                    {'domain': 'Feb', 'measure':  collectorListModel!.febCount?? '0'},
                    {'domain': 'Mar', 'measure':  collectorListModel!.marCount?? '0'},
                    {'domain': 'Apr', 'measure':  collectorListModel!.aprCount?? '0'},
                    {'domain': 'May', 'measure':  collectorListModel!.mayCount?? '0'},
                    {'domain': 'Jun', 'measure':  collectorListModel!.junCount?? '0'},
                    {'domain': 'Jul', 'measure':  collectorListModel!.junCount?? '0'},
                    {'domain': 'Aug', 'measure':  collectorListModel!.julCount?? '0'},
                    {'domain': 'Sep', 'measure':  collectorListModel!.augCount?? '0'},
                    {'domain': 'Oct', 'measure':  collectorListModel!.sepCount?? '0'},
                    {'domain': 'Nov', 'measure':  collectorListModel!.octCount?? '0'},
                    {'domain': 'Dec', 'measure':  collectorListModel!.novCount?? '0'},
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.grey,
              measureLabelPaddingToAxisLine: 20,
              barColor: (barData, index, id) => Colors.red,
              showBarValue: true,
            ),
            // % CHART
            DChartBar(
              data: [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': 'Jan', 'measure':  collectorListModel!.janCount?? '0'},
                    {'domain': 'Feb', 'measure':  collectorListModel!.febCount?? '0'},
                    {'domain': 'Mar', 'measure':  collectorListModel!.marCount?? '0'},
                    {'domain': 'Apr', 'measure':  collectorListModel!.aprCount?? '0'},
                    {'domain': 'May', 'measure':  collectorListModel!.mayCount?? '0'},
                    {'domain': 'Jun', 'measure':  collectorListModel!.junCount?? '0'},
                    {'domain': 'Jul', 'measure':  collectorListModel!.junCount?? '0'},
                    {'domain': 'Aug', 'measure':  collectorListModel!.julCount?? '0'},
                    {'domain': 'Sep', 'measure':  collectorListModel!.augCount?? '0'},
                    {'domain': 'Oct', 'measure':  collectorListModel!.sepCount?? '0'},
                    {'domain': 'Nov', 'measure':  collectorListModel!.octCount?? '0'},
                    {'domain': 'Dec', 'measure':  collectorListModel!.novCount?? '0'},
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: Colors.grey,
              measureLabelPaddingToAxisLine: 20,
              barColor: (barData, index, id) => Colors.orange,
              showBarValue: true,
            ),
          ],
        ),
      ),
    );
  }

  Future<CollectorModel?> getCollectorData() async {
    var response = await http.post(
        Uri.parse('https://www.crystalsolutions.com.pk/nadeemcr/colinfo.php'),
        body: {
          'FLocCod': colLocation,
          'FColCod': colCode,
        });

    var datay = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {


      collectorListModel= CollectorModel.fromJson(datay);

    }
    setState(() {});
    return collectorListModel;
  }

  getSharedPrefData()  async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      usrName = sp.getString('name');
      colCode = sp.getString('colCode');
      colLocation = sp.getString('location');
    });
    getCollectorData();
  }

}