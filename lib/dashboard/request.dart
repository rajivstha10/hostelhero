import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Request extends StatefulWidget {
  const Request({Key? key});

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController requestController = TextEditingController();

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
                controller: subjectController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Subject...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                controller: requestController,
                maxLength: 1000,
                maxLines: 9,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Describe your Request here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              ElevatedButton(
                onPressed: () async {
                  final subject = subjectController.text;
                  final request = requestController.text;

                  if (subject.isNotEmpty && request.isNotEmpty) {
                    // Save the request to Firestore
                    await saveRequestToFirestore(subject, request);

                    final snackBar = SnackBar(
                      content: const Text("Request Submitted!"),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    final snackBar = SnackBar(
                      content: const Text(
                        "Please fill in both subject and request fields.",
                      ),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveRequestToFirestore(String subject, String request) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collection =
          firestore.collection('requests'); // Replace with your collection name

      await collection.add({
        'subject': subject,
        'request': request,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Request saved to Firestore successfully.');
    } catch (error) {
      print('Error saving request to Firestore: $error');
      final snackBar = SnackBar(
        content:
            const Text("Error submitting request. Please try again later."),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    subjectController.dispose();
    requestController.dispose();
    super.dispose();
  }
}
