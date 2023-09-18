import 'package:flutter/material.dart';
import 'package:hostelhero/features/view/profile.dart';
import 'package:hostelhero/main.dart';
import 'package:hostelhero/settings/change_password.dart';
import 'package:hostelhero/settings/profile_image.dart';

void main() async {
  runApp(const MyApp());
}

class Settings_profile extends StatefulWidget {
  const Settings_profile({super.key});

  @override
  State<Settings_profile> createState() => _ProfileState();
}

class _ProfileState extends State<Settings_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.indigo.shade900,
        title: Center(child: Text("Settings_profile")),
      ),
      body: ListView(
        children: [
          //For change profile image
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
                      "Change Profile Image",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text("Change your profile image."),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileImage()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          //For change password
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
                      "Change Password",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text("Change your PAssword."),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
