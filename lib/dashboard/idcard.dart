import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../features/bottomnav/bottom_navbar.dart';

class IdCard extends StatelessWidget {
  const IdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
              },
              icon: Icon(Icons.arrow_back)),
          title: Center(child: Text("Id Card")),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                color: Colors.amber,
                height: 600,
                width: 400,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "HOSTEL NAME",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        "https://www.rumahsoal.id/storage/testimoni/January2021/AKkp5i6jZFbuxyDcPsoy.jpg",
                        height: 150,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Rajiv Shrestha",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      RichText(
                          text: TextSpan(
                              text: "Room: 301",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      RichText(
                          text: TextSpan(
                              text: "9813270136",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      RichText(
                          text: TextSpan(
                              text: "rajivstha10@gmail.com",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      RichText(
                          text: TextSpan(
                              text: "Budhanilkantha-13,Chunikhel",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      SizedBox(
                        height: 20,
                      ),
                      //For hostel details
                      Container(
                        color: Colors.blueAccent,
                        height: 100,
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Hostel Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                            RichText(
                                text: TextSpan(
                                    text: "01-5123544,01-6235785",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                            RichText(
                                text: TextSpan(
                                    text: "Location,Hostel",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: QrImageView(
                          data: "Rajiv Shrestha",
                          size: 80,
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
