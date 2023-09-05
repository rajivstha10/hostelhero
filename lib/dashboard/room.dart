import 'package:flutter/material.dart';

import '../features/bottomnav/bottom_navbar.dart';

class Room extends StatelessWidget {
  const Room({super.key});

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
        title: Center(
          child: Text("Room: 301"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.single_bed,
                  size: 50,
                ),
                title: Column(
                  children: [
                    Text(
                      "Bed-1",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("Room-mate"),
                  ],
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.single_bed,
                  size: 50,
                ),
                title: Column(
                  children: [
                    Text(
                      "Bed-2",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("Room-mate"),
                  ],
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.single_bed,
                  size: 50,
                ),
                title: Column(
                  children: [
                    Text(
                      "Bed-3",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("Room-mate"),
                  ],
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.single_bed,
                  size: 50,
                ),
                title: Column(
                  children: [
                    Text(
                      "Bed-4",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("Room-mate"),
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
