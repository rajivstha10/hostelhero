import 'package:flutter/material.dart';

import '../features/view/profile.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
        title: Center(child: Text("ChangePassword")),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Current Password:"),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: "Enter Current Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("New Password:"),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: "Enter New Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Confirm Password:"),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: "Enter Confirm Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text("Password changed successfully!"),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      )),
    );
  }
}
