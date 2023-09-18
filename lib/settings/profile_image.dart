import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelhero/profile_elements/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hostelhero/resources/add_data.dart';
import 'package:hostelhero/features/view/profile.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String imageUrl = ''; //image url is emptty atthis moment
  Uint8List? _image;

//get image
  @override
  void initState() {
    super.initState();
    // Fetch the image URL when the widget initializes
    _fetchImageUrl();
  }

  Future<void> _fetchImageUrl() async {
    try {
      final String downloadURL = await FirebaseStorage.instance
          .refFromURL('gs://hostel-hero.appspot.com/ProfileImage/id')
          .getDownloadURL();

      setState(() {
        imageUrl = downloadURL; //downloaded url is in image Url
      });
    } catch (e) {
      print('Error fetching image URL: $e');
    }
  }

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
                          backgroundImage: NetworkImage(imageUrl),
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
