import 'package:chatbox/pages/onboarding.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = true;

  // Function to validate the email
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingPage()),
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text("Sign up with Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))),
          SizedBox(
            height: 15,
          ),
          Text(
            "Get chatting with friends and family today by",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Text(
            "signing up for our chat app!",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Your name",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: _emailController,
                onChanged: (value) {
                  setState(() {
                    _isValidEmail = isValidEmail(value);
                  });
                },
                decoration: InputDecoration(
                  labelText: "Your email",
                  labelStyle: TextStyle(
                    color: _isValidEmail ? Color(0xFF24786D) : Colors.red,
                  ),
                  errorText: _isValidEmail ? null : null,
                ),
              )),
          if (!_isValidEmail)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  'Invalid email address',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          Spacer(
            flex: 3,
          ),
          InkWell(
            onTap: () {
              //create an account
            },
            child: Container(
              width: 327,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFF24786D)),
              child: Center(
                child: Text(
                  "Create an account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
