import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../features/bottomnav/bottom_navbar.dart';

class IdCard extends StatefulWidget {
  const IdCard({super.key});

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  String imageUrl = '';
  String name = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    // Fetch the image URL when the widget initializes
    _fetchImageUrl();
    _fetchUserProfile();
  }

  Future<void> _fetchImageUrl() async {
    try {
      final String downloadURL = await FirebaseStorage.instance
          .refFromURL('gs://hostel-hero.appspot.com/ProfileImage/id')
          .getDownloadURL();

      setState(() {
        imageUrl = downloadURL;
      });
    } catch (e) {
      print('Error fetching image URL: $e');
    }
  }

  //for fetching data from database
  Future<void> _fetchUserProfile() async {
    try {
      final userID =
          'o83iVhk1F3SVpLfc7uwuOVdljc72'; // Replace with the current user's ID
      final userDoc =
          FirebaseFirestore.instance.collection('profiles').doc(userID);
      final userData = await userDoc.get();

      setState(() {
        name = userData['name'] ?? '';
        phone = userData['phone'] ?? '';
      });
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

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
                      imageUrl == null
                          ? Image.network(
                              "https://www.rumahsoal.id/storage/testimoni/January2021/AKkp5i6jZFbuxyDcPsoy.jpg",
                              height: 150,
                            )
                          : Image.network(
                              imageUrl,
                              height: 150,
                            ),

                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: name,
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
                              text: phone,
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
