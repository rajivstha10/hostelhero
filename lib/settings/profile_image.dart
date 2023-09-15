import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hostelhero/features/view/profile.dart';
import 'package:hostelhero/main.dart';
import 'package:hostelhero/profile_elements/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hostelhero/resources/add_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String resp = await StoreData().saveData(file: _image!);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resp)));
  }

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
        title: Center(child: Text("Change Profile Image")),
      ),
      body: ListView(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Stack(children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://www.rumahsoal.id/storage/testimoni/January2021/AKkp5i6jZFbuxyDcPsoy.jpg",
                          ),
                          radius: 80,
                          backgroundColor: Colors.transparent,
                        ),
                  Positioned(
                    child: IconButton(
                        onPressed: selectImage, icon: Icon(Icons.add_a_photo)),
                    bottom: -10,
                    left: 100,
                  )
                ]),
              ]),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: saveProfile, child: Text("Save Profile"))
        ],
      ),
    );
  }
}

