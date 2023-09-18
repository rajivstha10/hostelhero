import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelhero/dashboard/request.dart';
import 'package:hostelhero/features/logs/login.dart';
import 'package:hostelhero/main.dart';
import 'package:hostelhero/profile_elements/edit_profile.dart';
import 'package:hostelhero/profile_elements/settings.dart';

void main() async {
  runApp(const MyApp());
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return ListView(
      children: [
        Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Stack(children: [
                  imageUrl == null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.rumahsoal.id/storage/testimoni/January2021/AKkp5i6jZFbuxyDcPsoy.jpg'),
                          radius: 80,
                          backgroundColor: Colors.transparent,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                          radius: 80,
                          backgroundColor: Colors.transparent,
                        ),
                ]),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    Row(
                      children: [
                        Icon(Icons.email),
                        RichText(
                          text: TextSpan(
                              text: 'rajivstha10@gmail.com',
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.meeting_room),
                        RichText(
                          text: TextSpan(
                              text: 'Room: 301',
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 2,
        ),
        //For Edit Profile
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            shadowColor: Colors.black,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text("Edit Your Profile"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Edit_Profile()));
                  },
                ),
              ],
            ),
          ),
        ),
        //For Request
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Request()));
          },
          child: Container(
              child: Card(
            elevation: 4,
            shadowColor: Colors.black,
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.request_quote),
                title: Text(
                  "Request",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Add Your Request"),
                trailing: Icon(Icons.chevron_right),
              ),
            ]),
          )),
        ),
        //For Settings
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Settings_profile()));
          },
          child: Container(
              child: Card(
            elevation: 4,
            shadowColor: Colors.black,
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Update Your Password and Details"),
                trailing: Icon(Icons.chevron_right),
              ),
            ]),
          )),
        ),
        //for Logout
        SizedBox(
          height: 10,
        ),
        Container(
            child: Card(
          elevation: 4,
          shadowColor: Colors.black,
          child: Column(children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Login()));
              },
              subtitle: Text("Logout From this Device"),
              trailing: Icon(Icons.chevron_right),
            ),
          ]),
        ))
      ],
    );
  }
}
