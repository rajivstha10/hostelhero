import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelhero/features/bottomnav/bottom_navbar.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //creating Email password and _auth variables
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

//Firebase Authentication for login
  Future<void> _logIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext) {
        return BottomNavBar();
      }));
    } catch (e) {
      final snackBar = SnackBar(
        content: const Text("Error Login!"),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("error during Login:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/hostel_hero.png",
              height: 110,
            ),
            SizedBox(
              height: 30,
            ),

            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.indigo.shade600)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ))),
            ),
            SizedBox(height: 10),
            //for password
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.indigo.shade600)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ))),
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            //for button
            Container(
              width: 250,
              child: ElevatedButton(
                  onPressed: _logIn,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade600,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
