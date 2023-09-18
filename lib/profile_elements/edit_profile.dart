import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.indigo.shade900,
        title: Center(child: Text("Edit Profile")),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter Name",
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.phone),
                  hintText: "Enter Phone No.",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final name = nameController.text;
                  final phone = phoneController.text;

                  if (name.isNotEmpty && phone.isNotEmpty) {
                    // Assuming you have a user identifier (e.g., userID) for the currently logged-in user
                    final userID = 'o83iVhk1F3SVpLfc7uwuOVdljc72';

                    // Reference to the Firestore document for the current user
                    final userDoc = FirebaseFirestore.instance
                        .collection('profiles')
                        .doc(userID);

                    try {
                      await userDoc.set({
                        'name': name,
                        'phone': phone,
                      });

                      final snackBar = SnackBar(
                        content: const Text("Profile Edited Successfully!"),
                        backgroundColor: Colors.green,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } catch (e) {
                      final snackBar = SnackBar(
                        content: const Text(
                          "Error editing profile. Please try again later.",
                        ),
                        backgroundColor: Colors.red,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {
                    final snackBar = SnackBar(
                      content: const Text(
                        "Please fill in all fields.",
                      ),
                      backgroundColor: Colors.red,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
