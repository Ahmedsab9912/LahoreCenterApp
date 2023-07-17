import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Column(
        children: [
         Row(
           children: [
             Center(
               child: Image(
                   width: 200,
                   height: 200,
                   image: AssetImage('images/CSlogo.png')),
             ),
             Column(
               children: [
                 Text('Crystal',style: TextStyle(color: Colors.blue[900],fontSize: 40,fontWeight: FontWeight.bold),),
                 Text('Solutions',style: TextStyle(color: Colors.orange[500],fontSize: 40,fontWeight: FontWeight.bold),)
               ],
             )
           ],
         ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.map,color: Colors.red,size: 30,),
                        SizedBox(width: 15,),
                        Text('15-D,Al Makkah Colony,Butt \nChowk, College Road, Lahore.',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.mail,color: Colors.red,size: 30,),
                        SizedBox(width: 15,),
                        Text('support@crystalsolutions.com.pk',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.send_to_mobile_outlined,color: Colors.red,size: 30,),
                        SizedBox(width: 15,),
                        Text('+9230044770075.',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.call,color: Colors.red,size: 30,),
                        SizedBox(width: 15,),
                        Text('+924235184077',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
}
