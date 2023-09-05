import 'package:flutter/material.dart';

import '../features/bottomnav/bottom_navbar.dart';

class Request extends StatelessWidget {
  const Request({super.key});

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
        title: Center(child: Text("Request")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Subject:"),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Subject...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Request:"),
                ],
              ),
              TextFormField(
                maxLength: 1000,
                maxLines: 10,
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Describe your Request here...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text("Request Submitted!"),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
