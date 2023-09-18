import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        title: Center(child: Text("Change Password")),
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
                controller: currentPasswordController,
                obscureText: true,
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
                controller: newPasswordController,
                obscureText: true,
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
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter Confirm Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Validate password change
                  final success = await _validatePasswordChange();
                  if (success) {
                    final snackBar = SnackBar(
                      content: Text("Password changed successfully!"),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    final snackBar = SnackBar(
                      content:
                          Text("Password change failed. Please try again."),
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

  Future<bool> _validatePasswordChange() async {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Check if the current password is correct (Firebase Auth)
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final credential = EmailAuthProvider.credential(
          email: currentUser.email!, password: currentPassword);

      try {
        final result =
            await currentUser.reauthenticateWithCredential(credential);

        if (result.user != null) {
          // Passwords match, now check the new password and confirmation
          if (newPassword == confirmPassword) {
            // Password change is valid
            await _auth.currentUser!.updatePassword(newPassword);
            return true;
          }
        }
      } catch (error) {
        print("Reauthentication error: $error");
      }
    }

    return false; // Default to false if any condition fails
  }
}
